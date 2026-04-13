import Swal from "sweetalert2"

document.addEventListener("turbo:load", () => {
    document.querySelectorAll(".delete-category-form").forEach((form) => {
        if (form.dataset.listenerAdded === "true") return

        form.dataset.listenerAdded = "true"

        form.addEventListener("submit", function (event) {
            if (form.dataset.confirmed === "true") return

            event.preventDefault()

            Swal.fire({
                title: "Tem certeza?",
                text: "Essa ação não pode ser desfeita.",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Sim, excluir",
                cancelButtonText: "Cancelar",
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    form.dataset.confirmed = "true"
                    form.requestSubmit()
                }
            })
        })
    })
})