FROM java:8-jdk

# RUN apt-get update && \
#     apt-get install openssl && \
#     apt-get clean

# Add WSO2AM sources to container
ADD wso2am-2.2.0.zip /opt
WORKDIR /opt

# Unzip sources
RUN unzip wso2am-2.2.0.zip && \
    rm wso2am-2.2.0.zip && \
    mv wso2am-2.2.0 wso2am && \
    chmod -R 777 /opt/wso2am

# Exposes WSO2 port
EXPOSE 9443 9763 8280 8243

# Start server
CMD wso2am/bin/wso2server.sh
