const { exec } = require('child_process');

module.exports = (req, res) => {
  exec('Rscript api.R', (error, stdout, stderr) => {
    if (error) {
      res.status(500).send(`Error: ${error.message}`);
      return;
    }
    if (stderr) {
      res.status(500).send(`Stderr: ${stderr}`);
      return;
    }
    res.status(200).send(stdout);
  });
};
