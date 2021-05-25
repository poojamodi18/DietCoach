package com.beans;

public class Payment {
	//i_payment_id, c_bankname, c_banktxn_id, c_currency, c_gateway_name, c_merchant_id, c_order_id, 
	//c_payment_mode, c_response_code, c_response_message, c_status, d_txn_amount, d_txn_date, c_txn_id, i_user_id
	private int paymentId;
	private String bankName;
	private String banktxnId;
	private String currency;
	private String gatewayName;
	private String merchantId;
	private String orderId;
	private String paymentMode;
	private String responseCode;
	private String responseMessage;
	private String status;
	private double txnAmount;
	private String txnDate;
	private String txnId;
	private int userId;
	@Override
	public String toString() {
		return "Payment [paymentId=" + paymentId + ", bankName=" + bankName + ", banktxnId=" + banktxnId + ", currency="
				+ currency + ", gatewayName=" + gatewayName + ", merchantId=" + merchantId + ", orderId=" + orderId
				+ ", paymentMode=" + paymentMode + ", responseCode=" + responseCode + ", responseMessage="
				+ responseMessage + ", status=" + status + ", txnAmount=" + txnAmount + ", txnDate=" + txnDate
				+ ", txnId=" + txnId + ", userId=" + userId + "]";
	}
	public int getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBanktxnId() {
		return banktxnId;
	}
	public void setBanktxnId(String banktxnId) {
		this.banktxnId = banktxnId;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getGatewayName() {
		return gatewayName;
	}
	public void setGatewayName(String gatewayName) {
		this.gatewayName = gatewayName;
	}
	public String getMerchantId() {
		return merchantId;
	}
	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getResponseCode() {
		return responseCode;
	}
	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}
	public String getResponseMessage() {
		return responseMessage;
	}
	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getTxnAmount() {
		return txnAmount;
	}
	public void setTxnAmount(Double txnAmount) {
		this.txnAmount = txnAmount;
	}
	public String getTxnDate() {
		return txnDate;
	}
	public void setTxnDate(String txnDate) {
		this.txnDate = txnDate;
	}
	public String getTxnId() {
		return txnId;
	}
	public void setTxnId(String txnId) {
		this.txnId = txnId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
}
