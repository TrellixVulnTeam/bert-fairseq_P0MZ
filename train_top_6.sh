CUDA_VISIBLE_DEVICES=0,1 python -m torch.distributed.launch --nproc_per_node 2 train.py --no-epoch-checkpoints --keep-last-epochs 1 --keep-interval-updates 2  --seed 200 --lr 3e-5 --encoder-lr-scale 1 --decoder-lr-scale 30 --min-lr 1e-09  --max-epoch 5 --decoder-layers 2 --update-freq 4 --task multi_tokens_task --arch bert_transformer_base  --bertpref query,passage-1,passage-2,passage-3,passage-4,passage-5,passage-6,target --defined-position --token-types 7 --data /nas/qsj/data-bin-v3/top-6-qa-nlg   --optimizer fix_adam --adam-betas '(0.9, 0.999)'  --criterion cross_entropy  --lr-scheduler fix_inverse_sqrt --reduce-dim 256 --decoder-head 8 --share-decoder-input-output-embed --max-query-positions 50 --max-passage-positions 250 --max-tokens 4000 --max-sentences 4 --tokenizer-dir /nas/qsj/bert-model/bert-base-uncased  --warmup-init-lr 1e-07 --min-lr 1e-08 --warmup-updates 10655  --no-progress-bar --weight-decay 0.01 --log-interval 1  --clip-norm 0.0  --save-interval-updates 3000  --save-dir checkpoints/top-6-test-model | tee -a train_log/top-6-test-model.log
