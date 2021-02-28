const token = document.querySelector("meta[name='csrf-token']").content;
const headers = { "Content-Type": "application/json", "X-CSRF-Token": token };


document.addEventListener('DOMContentLoaded', ()=>{

  document.querySelectorAll(".action > .btn_solicitar").forEach(button => {
    button.addEventListener('click', solicitar);
  });

  document.querySelectorAll('.action > .btn_social').forEach(button => {
    button.addEventListener('click', friend_accepted);
  })
});

const friend_accepted = event => {
  console.log('amigo aceito...');
}

const solicitar = event => {

  const actionElement = event.target.closest('.action');
  const url = '/friends';
  const options = {
    method: 'POST',
    headers,
    body: JSON.stringify({ friend: { friend: { actionElement.dataset.socialId } } })
  }

  connection(url, options)
}

const conection = (url, options)=>{
  fetch(url, options)
  .then(response => response.json)
  .then(data => console.log(data))
  .catch(errors => console.log(`ERROR(s) ${errors}`))
}

function solicitar(event){
  const actionElement = event.target.closest(".action");

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

function accept_friend(event){
  const actionElement = event.target.closest(".action");

  const id = actionElement.dataset.socialId

  fetch("/send_friend", {
    method: 'PATCH',
    headers
    // body: JSON.stringify({friend: {id: 1, friend: 1, status: 'accepted' } })
  })
  .then(response => console.log(response))
  .then(data => {
    console.log(data);
  })
  .catch(errors => console.log('erro: ' + errors))
}
