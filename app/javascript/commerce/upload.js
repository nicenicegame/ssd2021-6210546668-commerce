;(function () {
  document.addEventListener('turbolinks:load', () => {
    const fileFields = document.querySelectorAll('.file.has-name')

    fileFields.forEach((field) => {
      const fileInput = field.querySelector('.file-input')
      const fileName = field.querySelector('.file-name')

      fileInput.addEventListener('change', () => {
        const count = fileInput.files.length
        if (count > 0) {
          fileName.textContent = `${count} file${count > 1 ? 's' : ''} added.`
        }
      })
    })
  })
})()
