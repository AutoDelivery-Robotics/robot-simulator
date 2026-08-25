package main

import (
	"fmt"

	"go.uber.org/zap"
)

func main() {
	logger, _ := zap.NewProduction()
	defer logger.Sync()

	logger.Info("🎮 Robot Simulator is starting...")
	logger.Info("Đang chuẩn bị giả lập 1000 robot trên bản đồ...")

	fmt.Println("👉 Nhấn Ctrl+C để thoát ứng dụng.")
}
