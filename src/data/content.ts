import { Tutorial, SafetyRule, QuizQuestion, QuizSet } from '../types';

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
  },
  {
    id: 'q3',
    question: 'Before increasing microscope magnification, what should you do first?',
    questionZh: '提高显微镜倍率前，首先应该做什么？',
    options: [
      'Center and focus the specimen at low magnification',
      'Immediately switch to the highest objective',
      'Turn off the light source',
      'Remove the slide'
    ],
    optionsZh: [
      '先在低倍率下将样本居中并调焦',
      '直接切换到最高倍率物镜',
      '关闭光源',
      '取下载玻片'
    ],
    correctAnswer: 0,
    explanation: 'Starting low makes it easier to locate the specimen and prevents losing the field of view.',
    explanationZh: '先用低倍率更容易找到样本，也能避免切换后丢失视野。'
  },
  {
    id: 'q4',
    question: 'Which instrument is most suitable for quantitative gene-expression analysis?',
    questionZh: '哪种仪器最适合进行基因表达定量分析？',
    options: [
      'Real-time PCR system',
      'Electronic balance',
      'Water bath',
      'Dissecting microscope'
    ],
    optionsZh: [
      '实时荧光定量 PCR 仪',
      '电子天平',
      '恒温水浴锅',
      '解剖显微镜'
    ],
    correctAnswer: 0,
    explanation: 'Real-time PCR systems are designed for fluorescence-based nucleic-acid quantification.',
    explanationZh: '实时荧光定量 PCR 仪专门用于基于荧光信号的核酸定量。'
  },
  {
    id: 'q5',
    question: 'What is a key purpose of a gel imaging system?',
    questionZh: '凝胶成像系统的核心用途是什么？',
    options: [
      'Document and analyze nucleic-acid or protein gels',
      'Sterilize culture media',
      'Measure animal body weight',
      'Store frozen reagents'
    ],
    optionsZh: [
      '记录并分析核酸或蛋白凝胶',
      '灭菌培养基',
      '测量动物体重',
      '冷冻保存试剂'
    ],
    correctAnswer: 0,
    explanation: 'Gel imaging systems capture gel or blot signals for documentation and quantitative review.',
    explanationZh: '凝胶成像系统用于采集凝胶或印迹信号，以便记录和定量分析。'
  },
  {
    id: 'q6',
    question: 'Why should bubbles be avoided in microplate-reader assays?',
    questionZh: '使用酶标仪时为什么要避免气泡？',
    options: [
      'They can interfere with optical readings',
      'They increase incubation temperature',
      'They sterilize the sample',
      'They improve fluorescence intensity'
    ],
    optionsZh: [
      '会干扰光学读数',
      '会提高孵育温度',
      '会给样品灭菌',
      '会增强荧光强度'
    ],
    correctAnswer: 0,
    explanation: 'Bubbles scatter light and can distort absorbance or fluorescence measurements.',
    explanationZh: '气泡会散射光线，从而影响吸光度或荧光测定结果。'
  },
  {
    id: 'q7',
    question: 'Which safety practice is correct for alcohol burners?',
    questionZh: '关于酒精灯，哪项安全做法是正确的？',
    options: [
      'Extinguish with the cap rather than blowing it out',
      'Refill while the flame is still burning',
      'Place it beside organic solvents',
      'Leave it unattended during heating'
    ],
    optionsZh: [
      '用灯帽盖灭，而不是用嘴吹灭',
      '燃烧时直接补充酒精',
      '放在有机溶剂旁边',
      '加热时无人看管'
    ],
    correctAnswer: 0,
    explanation: 'Capping the burner is safer and reduces the risk of spreading flame.',
    explanationZh: '用灯帽盖灭更安全，可降低火焰蔓延风险。'
  },
  {
    id: 'q8',
    question: 'What should be done after using an oil-immersion objective?',
    questionZh: '使用油镜后应该怎么做？',
    options: [
      'Clean the lens promptly with lens paper',
      'Leave the oil to dry naturally',
      'Rinse the lens with tap water',
      'Store the microscope with oil still on the lens'
    ],
    optionsZh: [
      '及时用擦镜纸清洁镜头',
      '让香柏油自然风干',
      '用自来水冲洗镜头',
      '镜头带油直接收纳'
    ],
    correctAnswer: 0,
    explanation: 'Residual immersion oil can harden and damage optical performance if not removed promptly.',
    explanationZh: '残留香柏油若不及时清除，可能硬化并影响成像质量。'
  }
];

export const quizSets: QuizSet[] = [
  {
    id: 'safety',
    title: 'Laboratory Safety Access Test',
    titleZh: '实验室安全准入测试',
    description: 'Test essential laboratory safety rules before entering the lab.',
    descriptionZh: '测试进入实验室前必须掌握的基础安全规范。',
    questions: quizQuestions.slice(0, 4)
  },
  {
    id: 'equipment',
    title: 'Equipment Operation Test',
    titleZh: '仪器使用测试',
    description: 'Test standard operation knowledge for common laboratory equipment.',
    descriptionZh: '测试常见实验仪器的标准操作知识。',
    questions: quizQuestions.slice(4, 8)
  },
  {
    id: 'comprehensive',
    title: 'Comprehensive BioLab Test',
    titleZh: '综合生物实验测试',
    description: 'A mixed test covering safety, equipment, and experimental procedures.',
    descriptionZh: '综合测试安全、仪器和实验操作流程。',
    questions: quizQuestions
  }
];
