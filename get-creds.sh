while true;
do
	export AWS_ACCESS_KEY_ID=$(curl 'http://169.254.169.254/latest/meta-data/iam/security-credentials/data-science' | jq -r '.AccessKeyId');
	export AWS_SECRET_ACCESS_KEY=$(curl 'http://169.254.169.254/latest/meta-data/iam/security-credentials/data-science' | jq -r '.SecretAccessKey');
	export AWS_SESSION_TOKEN=$(curl 'http://169.254.169.254/latest/meta-data/iam/security-credentials/data-science' | jq -r '.Token');
	echo 'working';
	sleep $(curl 'http://169.254.169.254/latest/meta-data/iam/security-credentials/data-science' | python -c "from datetime import datetime;import sys,json; print(int((datetime.strptime(json.load(sys.stdin)['Expiration'],'%Y-%m-%dT%H:%M:%SZ') - datetime.now()).total_seconds()));")
done
