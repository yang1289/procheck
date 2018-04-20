package com.froala.editor;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;

import com.froala.editor.s3.S3Config;
import com.google.gson.Gson;

/**
 * Amazon S3 functionality.
 *
 * @author florin@froala.com
 */
public final class S3 {

	/**
	 * Private constructor.
	 */
	private S3() {

	}

	/**
	 * Get signature hash used by the editor to sign to Amazon S3 when uploading
	 * a file.
	 *
	 * @param config
	 *            Amazon S3 config.
	 * @return Signature hash.
	 * @throws Exception
	 */
	public final static Map<Object, Object> getHash(S3Config config) throws Exception {

		// Check default region.
		config.region = config.region != null ? config.region : "us-east-1";
		config.region = config.region == "s3" ? "us-east-1" : config.region;

		// Important variables that will be used throughout this example.
		String bucket = config.bucket;
		String region = config.region;
		String keyStart = config.keyStart;
		String acl = config.acl;

		// These can be found on your Account page, under Security Credentials >
		// Access Keys.
		String accessKey = config.accessKey;
		String secretKey = config.secretKey;

		SimpleDateFormat dt = new SimpleDateFormat("yyyyMMdd");
		Date now = new Date();

		String dateString = dt.format(now);

		String credential = String.join("/", new String[] { accessKey, dateString, region, "s3/aws4_request" });
		String xAmzDate = dateString + "T000000Z";

		SimpleDateFormat isoDt = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.000'Z'");
		String expirationDateString = isoDt.format(new Date(System.currentTimeMillis() + 5 * 60 * 1000));

		// Build policy.
		Map<Object, Object> policy = new HashMap<Object, Object>();
		policy.put("expiration", expirationDateString);

		ArrayList<Object> conditions = new ArrayList<Object>();

		Map<Object, Object> bucketCondition = new HashMap<Object, Object>();
		bucketCondition.put("bucket", bucket);
		conditions.add(bucketCondition);

		Map<Object, Object> aclCondition = new HashMap<Object, Object>();
		aclCondition.put("acl", acl);
		conditions.add(aclCondition);

		Map<Object, Object> successActionStatusCondition = new HashMap<Object, Object>();
		successActionStatusCondition.put("success_action_status", "201");
		conditions.add(successActionStatusCondition);

		Map<Object, Object> xRequestedWithCondition = new HashMap<Object, Object>();
		xRequestedWithCondition.put("x-requested-with", "xhr");
		conditions.add(xRequestedWithCondition);

		Map<Object, Object> xAmzAlgorithmCondition = new HashMap<Object, Object>();
		xAmzAlgorithmCondition.put("x-amz-algorithm", "AWS4-HMAC-SHA256");
		conditions.add(xAmzAlgorithmCondition);

		Map<Object, Object> xAmzCredentialCondition = new HashMap<Object, Object>();
		xAmzCredentialCondition.put("x-amz-credential", credential);
		conditions.add(xAmzCredentialCondition);

		Map<Object, Object> xAmzDateCondition = new HashMap<Object, Object>();
		xAmzDateCondition.put("x-amz-date", xAmzDate);
		conditions.add(xAmzDateCondition);

		conditions.add(new String[] { "starts-with", "$key", keyStart });
		conditions.add(new String[] { "starts-with", "$Content-Type", "" });

		policy.put("conditions", conditions);

		// Encode policy to base64.
		String policyBase64 = new String(Base64.encodeBase64(new Gson().toJson(policy).getBytes()));

		// Get signature.
		String signature;
		try {
			byte[] dateKey = Utils.hmac(("AWS4" + secretKey).getBytes("UTF-8"), dateString);
			byte[] dateRegionKey = Utils.hmac(dateKey, region);
			byte[] dateRegionServiceKey = Utils.hmac(dateRegionKey, "s3");
			byte[] signingKey = Utils.hmac(dateRegionServiceKey, "aws4_request");
			signature = Utils.hmac_hex(signingKey, policyBase64);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}

		// Return Amazon S3 signing hash.

		Map<Object, Object> hash = new HashMap<Object, Object>();
		hash.put("bucket", bucket);
		hash.put("region", region != "us-east-1" ? "s3-" + region : "s3");
		hash.put("keyStart", keyStart);

		Map<Object, Object> hashParams = new HashMap<Object, Object>();
		hashParams.put("acl", acl);
		hashParams.put("policy", policyBase64);
		hashParams.put("x-amz-algorithm", "AWS4-HMAC-SHA256");
		hashParams.put("x-amz-credential", credential);
		hashParams.put("x-amz-date", xAmzDate);
		hashParams.put("x-amz-signature", signature);
		hash.put("params", hashParams);

		return hash;
	}
}
