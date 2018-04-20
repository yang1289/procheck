package com.froala.editor.file;

/**
 * File Options used for uploading.
 *
 * @author florin@froala.com
 */
public class FileOptions {

	/**
	 * Default Froala Editor tag name that points to the file.
	 */
	public static final String fieldnameDefault = "file";

	/**
	 * Tag name that points to the file.
	 */
	private String fieldname;

	/**
	 * Get tag name that points to the file.
	 */
	public String getFieldname() {
		return fieldname;
	}

	/**
	 * Set tag name that points to the file.
	 */
	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}

	/**
	 * File validation.
	 */
	private FileValidation validation;

	/**
	 * Get file validation.
	 */
	public FileValidation getValidation() {
		return validation;
	}

	/**
	 * Set file validation.
	 */
	public void setValidation(FileValidation validation) {
		this.validation = validation;
	}

	/**
	 * Init default file upload settings.
	 */
	protected void initDefault() {
		setValidation(new FileValidation());
	}

	/**
	 * Constructor. Uses default options: - fieldname "file" - validation
	 * default FileValidation. To change them, use getters and setters.
	 */
	public FileOptions() {

		// Set default fieldname.
		setFieldname(fieldnameDefault);

		// Init default settings.
		initDefault();
	}
}
