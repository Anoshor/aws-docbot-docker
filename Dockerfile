FROM public.ecr.aws/lambda/python:3.11

# Set working directory to Lambda task root
WORKDIR ${LAMBDA_TASK_ROOT}

# Copy requirements first to leverage Docker cache
COPY requirements.txt .

# Install dependencies
RUN pip install pysqlite3-binary && \
    pip install -r requirements.txt --upgrade --prefer-binary

# Set environment variable
ENV IS_USING_IMAGE_RUNTIME=True

# Copy source code
COPY src/* .
COPY src/rag_app ./rag_app
COPY src/data/chroma ./data/chroma

# Expose port for local testing
EXPOSE 8000

# Set the handler
CMD [ "app_api_handler.handler" ]