const token = document.querySelector("meta[name='csrf-token']").content;
const headers = { "Content-Type": "application/json", "X-CSRF-Token": token };


document.addEventListener('DOMContentLoaded', ()=>{
  document.querySelectorAll(".action > .btn_solicitar").forEach(button => {
    button.addEventListener('click', solicitar);
  });
});

function solicitar(event){
  const actionElement = event.target.closest(".action");
  const elem = actionElement.dataset.socialId;

  fetch("/friends", {
    method: 'POST',
    headers,
    body: JSON.stringify({friend: { friend: actionElement.dataset.socialId } })
  })
  .then(response => response.json())
  .then(data => {
    console.log(data);
    actionElement.innerHTML = ''
    actionElement.innerHTML = aguardar();
  })
  .catch(errors => console.log('erro: ' + errors))
}

const aguardar = ()=>{
  const btn = `
    <div class= 'btn_aguardando'>
      <i class='fas fa-retweet'></i>
      pendente...
    </div>
  `
  return btn;
}
