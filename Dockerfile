FROM golang:1.25-alpine AS builder
WORKDIR /app
COPY shared/go shared/go
COPY backend/robot-simulator backend/robot-simulator
WORKDIR /app/backend/robot-simulator
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./cmd/server/main.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/backend/robot-simulator/main .
CMD ["./main"]
