import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [
    "database",
    "skipNamespace",
    "skipCollisionCheck",
    "previewCode",
  ];

  connect() {
    this.updatePreview();
  }

  submit(event) {
    event.preventDefault();
    this.updatePreview();
  }

  updatePreview() {
    const database = this.databaseTarget.value;
    const skipNamespace = this.skipNamespaceTarget.value;
    const skipCollisionCheck = this.skipCollisionCheckTarget.value;
    const command = `rails new --database=${database} --skip-namespace=${skipNamespace} --skip-collision-check=${skipCollisionCheck}`;
    this.previewCodeTarget.innerText = command;
  }
}
