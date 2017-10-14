package com.froala.editor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.ArrayUtils;

import com.froala.editor.image.ImageOptions;
import com.froala.editor.image.ImageValidation;

/**
 * Image functionality.
 *
 * @author florin@froala.com
 */
public final class Image {

	/**
	 * Private constructor.
	 */
	private Image() {

	}

	/**
	 * File default options.
	 */
	public static final ImageOptions defaultOptions = new ImageOptions();

	/**
	 * Uploads an image to disk.
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
	 * Uploads an image to disk.
	 *
	 * @param req
	 *            Servlet HTTP request.
	 * @param fileRoute
	 *            Server route where the file will be uploaded. This route must
	 *            be public to be accesed by the editor.
	 * @param options
	 *            Image options. Defaults to {@link #defaultOptions} which has
	 *            </br>
	 *            Fieldname: "file" </br>
	 *            Validation:
	 *            <ul>
	 *            <li>Extensions: "gif", "jpeg", "jpg", "png", "svg",
	 *            "blob"</li>
	 *            <li>Mime Types: "image/gif", "image/jpeg", "image/pjpeg",
	 *            "image/x-png", "image/png", "image/svg+xml"</li>
	 *            </ul>
	 *
	 * @return Object with link.
	 * @throws Exception
	 */
	public static Map<Object, Object> upload(HttpServletRequest req, String fileRoute, ImageOptions options)
			throws Exception {

		if (options == null) {
			options = defaultOptions;
		}

		return File.upload(req, fileRoute, options);
	}

	/**
	 * Delete an image from disk.
	 *
	 * @param req
	 *            Used to get the servlet context.
	 * @param src
	 *            Server file path.
	 */
	public static void delete(HttpServletRequest req, String src) {
		File.delete(req, src);
	}

	/**
	 * List images from disk.
	 *
	 * @param req
	 *            Used to get the servlet context.
	 * @param folderPath
	 *            Server folder path.
	 * @return Array of image objects.
	 * @throws Exception
	 */
	public static ArrayList<Object> list(HttpServletRequest req, String folderPath) throws Exception {
		return list(req, folderPath, folderPath);
	}

	/**
	 * List images from disk.
	 *
	 * @param req
	 *            Used to get the servlet context.
	 * @param folderPath
	 *            Server folder path.
	 * @param thumbPath
	 *            Optional. Server thumb path.
	 * @return Array of image objects.
	 * @throws Exception
	 */
	public static ArrayList<Object> list(HttpServletRequest req, String folderPath, String thumbPath) throws Exception {

		// Use thumbPath as folderPath.
		if (thumbPath == null) {
			thumbPath = folderPath;
		}

		// Array of image objects to return.
		ArrayList<Object> response = new ArrayList<Object>();

		String absolutePath = File.getAbsoluteServerPath(req, folderPath);

		String[] imageMimetypes = ImageValidation.allowedImageMimeTypesDefault;

		java.io.File folder = new java.io.File(absolutePath);

		// Add images.
		for (java.io.File fileEntry : folder.listFiles()) {
			if (fileEntry.isFile()) {

				String filename = fileEntry.getName();

				String mimeType = req.getServletContext().getMimeType(folderPath + filename);
				if (mimeType == null) {
					continue;
				}

				if (ArrayUtils.contains(imageMimetypes, mimeType)) {

					Map<Object, Object> imageObj = new HashMap<Object, Object>();
					imageObj.put("url", folderPath + filename);
					imageObj.put("thumb", thumbPath + filename);
					imageObj.put("name", filename);
					response.add(imageObj);
				}
			}
		}

		return response;
	}

}
