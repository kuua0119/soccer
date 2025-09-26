import consumer from "./consumer"

document.addEventListener("turbo:load", () => {
  const roomElement = document.getElementById("room-id")
  if (!roomElement) return

  const roomId = roomElement.dataset.roomId

  consumer.subscriptions.create(
    { channel: "RoomChannel", room_id: roomId },
    {
      received(data) {
        const messages = document.getElementById("messages")
        messages.insertAdjacentHTML("beforeend", data)
        messages.scrollTop = messages.scrollHeight // 自動スクロール
      }
    }
  )
})