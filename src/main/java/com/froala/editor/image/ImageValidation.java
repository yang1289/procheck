package com.froala.editor.image;

import com.froala.editor.CustomValidation;
import com.froala.editor.file.FileValidation;

/**
 * Image Validation.
 * 
 * @author florin@froala.com
 */
public class ImageValidation extends FileValidation {

	/**
	 * Allowed image validation default extensions.
	 */
	public static final String[] allowedImageExtsDefault = new String[] { "gif", "jpeg", "jpg", "png", "svg", "blob" };

	/**
	 * Allowed image validation default mimetypes.
	 */
	public static final String[] allowedImageMimeTypesDefault = new String[] { "image/gif", "image/jpeg", "image/pjpeg",
			"image/x-png", "image/png", "image/svg+xml" };

	/**
	 * Init default image validation settings.
	 */
	@Override
	protected void initDefault() {

		allowedExts = allowedImageExtsDefault;
		allowedMimeTypes = allowedImageMimeTypesDefault;
	}

	/**
	 * Constructor. Validates default images with: - allowed file extensions:
	 * "gif", "jpeg", "jpg", "png", "svg", "blob" - allowed mime types:
	 * "image/gif", "image/jpeg", "image/pjpeg", "image/x-png", "image/png",
	 * "image/svg+xml"
	 */
	public ImageValidation() {
		super();
	}

	/**
	 * Constructor.
	 *
	 * @param allowedExts
	 *            Allowed validation image extensions.
	 * @param allowedMimeTypes
	 *            Allowed validation image mimetypes.
	 */
	public ImageValidation(String[] allowedExts, String[] allowedMimeTypes) {
		super(allowedExts, allowedMimeTypes);
	}

	/**
	 * Constructor.
	 *
	 * @param customValidation
	 *            Custom validation.
	 */
	public ImageValidation(CustomValidation customValidation) {
		super(customValidation);
	}
}
