import express from 'express';

const app = express();
const port = 8080;

app.use(
    express.json({
        type: () => true,
    })
);

app.get('/', (req, res) => {
    setTimeout(() => {
        res.send('Hello World!');
    }, 1000);
});

let tagSerial = null;

const SERIAL_PATTERN = /^[0-9a-fA-F]{1,2}(:[0-9a-fA-F]{1,2})+$/;

app.post('/tag', (req, res) => {
    if ('serial' in req.body && typeof req.body.serial === 'string') {
        /** @type {string} */
        const serial = req.body.serial;

        if (!SERIAL_PATTERN.test(serial)) {
            res.status(400).json({ error: 'Invalid serial format' });
            return;
        }
        tagSerial = serial;
        res.status(202).send();
    } else {
        res.status(400).json({ error: 'Serial is required' });
    }
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
