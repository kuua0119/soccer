import consumer from "./consumer"

document.addEventListener("turbo:load", () => {
  const chatBox = document.querySelector(".chat-box")
  if (!chatBox) return

  const communityId = chatBox.dataset.communityId

  consumer.subscriptions.create(
    { channel: "CommunityChannel", community_id: communityId },
    {
      received(data) {
        chatBox.insertAdjacentHTML("beforeend", data)
        chatBox.scrollTop = chatBox.scrollHeight
      }
    }
  )
})
