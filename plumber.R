# plumber.R
library(plumber)
library(vetiver)
library(pins)

# Muat board dan model yang telah disimpan
board <- board_folder(path = ".")
v <- vetiver_pin_read(board, "example_model")

# Buat API endpoint untuk melakukan prediksi
#* @apiTitle Vetiver Model API

#* Prediksi dengan model
#* @param sepal_width Sepal Width
#* @param petal_length Petal Length
#* @param petal_width Petal Width
#* @post /predict
function(sepal_width, petal_length, petal_width) {
  new_data <- data.frame(Sepal.Width = as.numeric(sepal_width),
                         Petal.Length = as.numeric(petal_length),
                         Petal.Width = as.numeric(petal_width))
  predict(v, new_data)
}
