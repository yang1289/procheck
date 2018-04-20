package com.froala.editor;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

import com.froala.editor.file.FileOptions;
import com.froala.editor.image.ImageOptions;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.Thumbnails.Builder;
import org.springframework.beans.factory.annotation.Autowired;
import procheck.common.config.SiteConfig;

/**
 * File functionality.
 *
 * @author florin@froala.com
 */
public final class File {

	/**
	 * Content type string used in http multipart.
	 */
	public static final String multipartContentType = "multipart/form-data";


	/**
	 * Private constructor.
	 */
	private File() {

	}

	/**
	 * File default options.
	 */
	public static final FileOptions defaultOptions = new FileOptions();

	/**
	 * Uploads a file to disk.
	 *
	 * @param req
	 *            Servlet HTTP request.
	 * @param fileRoute
	 *            Route Server route where the file will be uploaded. This route
	 *            must be public to be accesed by the editor.
	 * @return Object with link.
	 * @throws Exception
	 */
	public static Map<Object, Object> upload(HttpServletRequest req, String fileRoute) throws Exception {

		return upload(req, fileRoute, defaultOptions);
	}

	/**
	 * Uploads a file to disk.
	 *
	 * @param req
	 *            Servlet HTTP request.
	 * @param fileRoute
	 *            Server route where the file will be uploaded. This route must
	 *            be public to be accesed by the editor.
	 * @param options
	 *            File options. Defaults to {@link #defaultOptions} which has
	 *            </br>
	 *            Fieldname: "file" </br>
	 *            Validation:
	 *            <ul>
	 *            <li>Extensions: "txt", "pdf", "doc"</li>
	 *            <li>Mime Types: "text/plain", "application/msword",
	 *            "application/x-pdf", "application/pdf"</li>
	 *            </ul>
	 * @return Object with link.
	 * @throws Exception
	 */
	public static Map<Object, Object> upload(HttpServletRequest req, String fileRoute, FileOptions options)
			throws Exception {

		if (options == null) {
			options = defaultOptions;
		}

		if (req.getContentType() == null || req.getContentType().toLowerCase().indexOf(multipartContentType) == -1) {

			throw new Exception("Invalid contentType. It must be " + multipartContentType);
		}

		Part filePart = req.getPart(options.getFieldname());

		if (filePart == null) {
			throw new Exception("Fieldname is not correct. It must be: " + options.getFieldname());
		}

		// Generate random name.
		String extension = FilenameUtils.getExtension(Utils.getFileName(filePart));
		extension = (extension != null && extension != "") ? "." + extension : extension;
		String name = Utils.generateUniqueString() + extension;

		String linkName = fileRoute + name;

		InputStream fileContent = filePart.getInputStream();
		String absoluteServerPath = getAbsoluteServerPath(req, linkName);

		java.io.File targetFile = new java.io.File(absoluteServerPath);

		// Resize image.
		if (options instanceof ImageOptions && ((ImageOptions) options).getResizeOptions() != null) {

			ImageOptions.ResizeOptions imageOptions = ((ImageOptions) options).getResizeOptions();

			Builder<? extends InputStream> thumbnailsBuilder = Thumbnails.of(fileContent);

			// Check aspect ratio.
			int newWidth = imageOptions.getNewWidth();
			int newHeight = imageOptions.getNewHeight();
			if (imageOptions.getKeepAspectRatio()) {
				thumbnailsBuilder = thumbnailsBuilder.size(newWidth, newHeight);
			} else {
				thumbnailsBuilder = thumbnailsBuilder.forceSize(newWidth, newHeight);
			}

			thumbnailsBuilder.toFile(targetFile);
		} else {
			FileUtils.copyInputStreamToFile(fileContent, targetFile);
		}

		if (options.getValidation() != null
				&& !options.getValidation().check(absoluteServerPath, filePart.getContentType())) {

			delete(req, linkName);
			throw new Exception("File does not meet the validation.");
		}

		Map<Object, Object> linkObject = new HashMap<Object, Object>();
		linkObject.put("link", linkName);
		return linkObject;
	}

	/**
	 * Get absolute server path.
	 *
	 * @param req
	 *            Used to get the servlet context.
	 * @param relativePath
	 *            Relative path.
	 * @return Absolute path.
	 */
	public static String getAbsoluteServerPath(HttpServletRequest req, String relativePath) {
		String rootPath=req.getServletContext().getRealPath("");
		rootPath=rootPath.substring(0,rootPath.indexOf("src"));
		return rootPath+relativePath;
//		return req.getServletContext().getRealPath(relativePath);
	}

	/**
	 * Delete a file from disk.
	 *
	 * @param req
	 *            Used to get the servlet context.
	 * @param src
	 *            Server file path.
	 */
	public static void delete(HttpServletRequest req, String src) {

		String filePath = getAbsoluteServerPath(req, src);

		java.io.File file = new java.io.File(filePath);
		if (file.exists()) {
			file.delete();
		}
	}
}
