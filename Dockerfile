# ---------- Build Stage ----------
FROM golang:1.22 AS builder

WORKDIR /app

# Install git using apt
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Cache dependencies
COPY app/go.mod .
RUN go mod download

# Copy source
COPY app/ .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server .

# ---------- Runtime Stage ----------
FROM alpine:3.20

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --from=builder /app/server .
RUN chown appuser:appgroup /app/server

USER appuser

EXPOSE 8080
ENTRYPOINT ["./server"]
