// Script pour initialiser la collection app_config dans Firebase
// Exécuter ce script dans la console Firebase ou via l'interface web

const admin = require("firebase-admin");

// Initialiser Firebase Admin (remplacer par vos credentials)
const serviceAccount = require("./path-to-your-service-account-key.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const db = admin.firestore();

async function setupAppConfig() {
  try {
    // Créer la collection app_config avec le document config
    await db
      .collection("app_config")
      .doc("config")
      .set({
        terms_of_use: {
          isActive: true,
          languages: {
            en: "https://your-domain.com/en/terms-of-use",
            fr: "https://your-domain.com/fr/conditions-utilisation",
          },
          lastUpdated: admin.firestore.Timestamp.now(),
          url: "https://your-domain.com/terms-of-use",
          version: "1.2.0",
        },
        privacy_policy: {
          isActive: true,
          languages: {
            en: "https://your-domain.com/en/privacy-policy",
            fr: "https://your-domain.com/fr/politique-confidentialite",
          },
          lastUpdated: admin.firestore.Timestamp.now(),
          url: "https://your-domain.com/privacy-policy",
          version: "1.0.0",
        },
      });

    console.log("Configuration Firebase créée avec succès!");
  } catch (error) {
    console.error("Erreur lors de la création de la configuration:", error);
  }
}

setupAppConfig();
