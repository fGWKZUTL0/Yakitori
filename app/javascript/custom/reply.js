{
  const exampleModal = document.getElementById("exampleModal")

  document.addEventListener('show.bs.modal', function (event) {
    // Button that triggered the modal
    const button = event.relatedTarget
    // Extract info from data-bs-* attributes
    const recipient = button.getAttribute('data-bs-whatever')
    // If necessary, you could initiate an AJAX request here
    // and then do the updating in a callback.
    //
    // Update the modal's content.
    //const modalTitle = exampleModal.querySelector('.modal-title')
    //const modalBodyInput = exampleModal.querySelector('.modal-body input')
  
    //modalTitle.textContent = 'New message to ' + recipient
    document.getElementById("parent_id").value = recipient
  })

  const submit_btn = document.getElementById("btn_submit")
  const modal_form = document.getElementById("modal_form")

  let myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
    keyboard: false
  })
  
  submit_btn.addEventListener('click', function(event){
    event.preventDefault()
    myModal.hide()
    modal_form.submit()
  })
}