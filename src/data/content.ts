import { Tutorial, SafetyRule, QuizQuestion } from '../types';

export const tutorialData: Tutorial[] = [
  {
    id: 't1',
    title: 'Microscope Operation',
    titleZh: '显微镜操作',
    equipmentId: 'microscope',
    steps: [
      { title: 'Preparation', titleZh: '准备工作', description: 'Plug in and turn on the light. Adjust brightness.', descriptionZh: '插上电源并打开灯。调节亮度。' },
      { title: 'Mounting', titleZh: '安装', description: 'Place slide on stage, secure with clips.', descriptionZh: '将载玻片放在载物台上，用夹子固定。' },
      { title: 'Focusing', titleZh: '调焦', description: 'Use coarse focus with 4x objective, then fine focus.', descriptionZh: '使用4倍物镜进行粗调焦，然后进行细调焦。' },
      { title: 'Magnification', titleZh: '倍率调节', description: 'Switch to 10x or 40x and refocus with fine knob only.', descriptionZh: '切换到10倍或40倍，仅使用细准焦螺旋重新调焦。' }
    ]
  },
  {
    id: 't2',
    title: 'Micropipette Usage',
    titleZh: '微量移液枪使用',
    equipmentId: 'pipette',
    steps: [
      { title: 'Volume Setting', titleZh: '体积设置', description: 'Turn dial to set desired volume.', descriptionZh: '转动旋钮设置所需体积。' },
      { title: 'Tip Attachment', titleZh: '吸头安装', description: 'Press pipette firmly into a clean tip.', descriptionZh: '将移液枪用力按入干净的吸头中。' },
      { title: 'Aspiration', titleZh: '吸取', description: 'Press to 1st stop, submerge, release slowly.', descriptionZh: '按至第一档，浸入液体，缓慢释放。' },
      { title: 'Dispensing', titleZh: '排出', description: 'Press to 2nd stop to fully eject liquid.', descriptionZh: '按至第二档以完全排出液体。' }
    ]
  }
];

export const safetyRules: SafetyRule[] = [
  {
    id: 's1',
    title: 'PPE Requirements',
    titleZh: '个人防护装备要求',
    content: 'Always wear lab coat, gloves, and safety goggles when handling chemicals or biohazards.',
    contentZh: '处理化学品或生物危害物时，务必穿着实验服、戴手套和安全护目镜。',
    icon: 'ShieldCheck'
  },
  {
    id: 's2',
    title: 'Behavioral Rules',
    titleZh: '行为准则',
    content: 'No eating, drinking, or running in the lab. Keep your workspace clean and organized.',
    contentZh: '实验室内禁止饮食或奔跑。保持工作区整洁有序。',
    icon: 'AlertTriangle'
  },
  {
    id: 's3',
    title: 'Waste Disposal',
    titleZh: '废物处理',
    content: 'Dispose of biohazards in yellow bags, sharps in red containers, and glass in blue boxes.',
    contentZh: '将生物危害物丢弃在黄色袋子中，将锐器丢弃在红色容器中，将玻璃丢弃在蓝色盒子中。',
    icon: 'Trash2'
  },
  {
    id: 's4',
    title: 'Hygiene',
    titleZh: '个人卫生',
    content: 'Wash hands thoroughly with soap before leaving the laboratory.',
    contentZh: '离开实验室前用肥皂彻底洗手。',
    icon: 'Waves'
  }
];

export const quizQuestions: QuizQuestion[] = [
  {
    id: 'q1',
    question: 'When using a centrifuge, what is the most important safety step?',
    questionZh: '使用离心机时，最重要的安全步骤是什么？',
    options: [
      'Setting the highest speed',
      'Balancing the tubes opposite each other',
      'Opening the lid immediately after it stops',
      'Using only one tube'
    ],
    optionsZh: [
      '设置最高速度',
      '将试管相对放置以保持平衡',
      '停止后立即打开盖子',
      '仅使用一根试管'
    ],
    correctAnswer: 1,
    explanation: 'Unbalanced centrifuges can cause severe vibration and damage.',
    explanationZh: '不平衡的离心机会导致剧烈振动和损坏。'
  },
  {
    id: 'q2',
    question: 'To aspirate liquid with a micropipette, you should press the plunger to:',
    questionZh: '使用微量移液枪吸取液体时，应将控制杆按至：',
    options: [
      'The first stop',
      'The second stop',
      'All the way down',
      'Halfway'
    ],
    optionsZh: [
      '第一档',
      '第二档',
      '按到底',
      '一半'
    ],
    correctAnswer: 0,
    explanation: 'The first stop is for aspiration; the second stop is for dispensing.',
    explanationZh: '第一档用于吸取；第二档用于排出。'
  }
];
