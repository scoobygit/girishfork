FROM breakdowns/mega-sdk-python:latest

# Simulated AWS credentials - DO NOT USE REAL SECRETS
ENV AWS_ACCESS_KEY_ID="AKIAFAKEKEY1234567890"
ENV AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K7MDENG/fakeSecretKey"

# Simulated GitHub token
ENV GITHUB_TOKEN="ghp_fakeGitHubToken12345678901234567890"

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN chmod +x /usr/local/bin/extract && chmod +x /usr/local/bin/pextract
COPY . .
COPY .netrc /root/.netrc
RUN chmod 600 /usr/src/app/.netrc
RUN chmod +x aria.sh

# Simulated private API key
ENV API_KEY="12345-abcde-SECRET-98765"

CMD ["bash","start.sh"]






