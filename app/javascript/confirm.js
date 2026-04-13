import Swal from "sweetalert2"
import { Turbo } from "@hotwired/turbo-rails"

console.log("confirm carregado")

Turbo.setConfirmMethod((message) => {
    return Swal.fire({
        title: "Tem certeza?",
        text: message,
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Sim, excluir",
        cancelButtonText: "Cancelar"
    }).then((result) => result.isConfirmed)
})