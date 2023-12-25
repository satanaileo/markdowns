# Dataset and DataLoader

### Definiton: Epoch

One forward pass and one backward pass of all the training examples

### Definition: Batch-size

The number of training examples in one forward backward pass



**Dataset** is an abstract class. We can define our class inherited from  this class.

**DataLoader** is a class to help us loading data in PyTorch

```python
import torch
from torch.utils.data import Dataset
from torch.utils.data import DataLoader

class MyDataset(Dataset):
	def __init__(self):
        pass
    
    def __getitem__(self, index):
        pass  # 实现本魔法方法后可以下标调用元素, dataset[idx]
    
    def __len(self):
        pass

dataset = MyDataset()
data_loader = DataLoader(dataset=dataset, 
                         batch_size=32, 
                         shuffle=True,
                         num_workers=2
                        )

for epoch in range(100):
    for i, data in enumerate(data_loader, 0):
        inputs, labels = data
        y_pred = model(inputs)
        loss = criterion(y_pred, labels)
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()
```

 ### tensorboard

#### SummaryWriter

````python
from torch.utils.tensorboard import SummaryWriter

writer = SummaryWriter("logs")

for i in range(epoch):
    writer.add_scalar()
````

##### 打开事件文件

tensorboard --logdir=logs