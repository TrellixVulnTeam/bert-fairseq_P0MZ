rm checkpoints/msra-ner/*
CUDA_VISIBLE_DEVICES=0,1 python -m torch.distributed.launch --nproc_per_node 2 train.py --lr 3e-5 --min-lr 1e-09  --max-epoch 10 --update-freq 4 --task bert_ner_task --arch bert_NER_model  --bertpref sens,tags --data /nas/qsj/data-bin-ner/msra-BIO   --optimizer adam --adam-betas '(0.9, 0.999)'  --criterion ner_acc_cross_entropy  --lr-scheduler inverse_sqrt --max-tokens 2500 --max-sentences 32 --tokenizer-dir /nas/qsj/bert-model/bert-base-chinese  --warmup-init-lr 1e-07 --min-lr 1e-08 --warmup-updates 145 --no-progress-bar --weight-decay 0.01 --log-interval 50  --clip-norm 0.0  --save-interval-updates 8000  --save-dir checkpoints/msra-ner | tee -a train_log/msra-ner.log