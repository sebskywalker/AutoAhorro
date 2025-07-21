from pathlib import Path

# Contenido del README.md
readme_content = """# 💰 AutoAhorro

Simulador de autoahorro que redondea gastos y calcula remanentes por transacción, tomando en cuenta restricciones temporales y evaluaciones configurables.

---

## 🚀 ¿Qué hace este proyecto?

`AutoAhorro` recibe una lista de transacciones simuladas (fecha y monto), y calcula para cada una:

- El **techo redondeado al múltiplo de 100 más cercano**.
- El **remanente** (diferencia entre techo y monto).
- Aplica **bonificaciones extra o restricciones fijas** según ventanas de tiempo.
- Genera un resultado en formato JSON con transacciones válidas e inválidas.

---

## 🧱 Estructura del proyecto

```
Sources/
├── Domain/
│   ├── DomainModels.swift         // Modelos: Restriction, Transaction, Output, etc.
├── Input/
│   └── UserInput.swift            // [Por implementar] Entrada dinámica del usuario
├── IO/
│   └── JSONExporter.swift         // Exporta resultado como JSON legible
├── Logic/
│   └── TransactionProcessor.swift // Procesamiento, redondeo, formatter
└── AutoAhorro/
    └── main.swift                 // Orquesta todo (entrada simulada)
```

---

## 🧪 ¿Cómo correrlo?

1. Abre el proyecto en **Xcode**.
2. Asegúrate de estar en la rama `main` y en la versión `v1.0-estable`.
3. Ejecuta `main.swift`.
4. Verás el resultado en consola como JSON.

---

## 🧾 Ejemplo de salida

```json
{
  "invalid": [],
  "valid": [
    {
      "amount": 250,
      "remanent": 75,
      "date": "2023-10-12 20:15",
      "ceiling": 300
    },
    {
      "amount": 375,
      "remanent": 25,
      "date": "2023-02-28 15:49",
      "ceiling": 400
    }
  ]
}
```

---

## 🧭 Roadmap

✅ v1.0-estable  
🔜 v1.1 - Entrada por consola (`UserInput.swift`)  
🔜 v2.0 - Versión visual con SwiftUI para iPhone  

---

## 🧑‍💻 Autor

Desarrollado por **Sebastián Verástegui**  
🔗 [https://sebsverastegui.com](https://sebsverastegui.com)  
"""

# Guardar el archivo
readme_path = Path("/mnt/data/README.md")
readme_path.write_text(readme_content)

readme_path.name