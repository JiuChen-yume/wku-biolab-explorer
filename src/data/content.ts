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

const safetyQuestions: QuizQuestion[] = [
  {
    id: 'safety-1',
    question: 'What personal protective equipment should be worn when handling chemicals?',
    questionZh: '处理化学品时应佩戴哪些个人防护装备？',
    options: ['Lab coat, gloves, and goggles', 'Only gloves', 'Only a mask', 'No PPE is needed'],
    optionsZh: ['实验服、手套和护目镜', '只戴手套', '只戴口罩', '不需要防护装备'],
    correctAnswer: 0,
    explanation: 'Basic PPE reduces exposure to chemical and biological hazards.',
    explanationZh: '基本个人防护装备可以降低接触化学和生物危害的风险。'
  },
  {
    id: 'safety-2',
    question: 'What should you do before leaving the laboratory?',
    questionZh: '离开实验室前应该做什么？',
    options: ['Wash hands thoroughly', 'Remove labels from samples', 'Turn off all refrigerators', 'Leave gloves on'],
    optionsZh: ['彻底洗手', '撕掉样品标签', '关闭所有冰箱', '继续戴着手套'],
    correctAnswer: 0,
    explanation: 'Hand washing prevents contamination outside the laboratory.',
    explanationZh: '洗手可以防止污染物被带出实验室。'
  },
  {
    id: 'safety-3',
    question: 'Which action is prohibited in the laboratory?',
    questionZh: '实验室中禁止哪种行为？',
    options: ['Eating or drinking', 'Wearing goggles', 'Labeling samples', 'Cleaning the bench'],
    optionsZh: ['饮食', '佩戴护目镜', '标记样品', '清洁实验台'],
    correctAnswer: 0,
    explanation: 'Eating or drinking in the lab can cause accidental exposure to hazards.',
    explanationZh: '在实验室饮食可能导致意外接触有害物质。'
  },
  {
    id: 'safety-4',
    question: 'Where should sharps such as needles or blades be disposed?',
    questionZh: '针头或刀片等锐器应丢弃在哪里？',
    options: ['Sharps container', 'Regular trash bin', 'Sink', 'Paper recycling bin'],
    optionsZh: ['锐器盒', '普通垃圾桶', '水槽', '纸张回收箱'],
    correctAnswer: 0,
    explanation: 'Sharps containers prevent injury and contamination.',
    explanationZh: '锐器盒可以防止刺伤和污染。'
  },
  {
    id: 'safety-5',
    question: 'What should you do if a chemical spill occurs?',
    questionZh: '发生化学品泄漏时应该怎么做？',
    options: ['Notify the instructor immediately', 'Ignore it', 'Wipe it with bare hands', 'Cover it with paper only'],
    optionsZh: ['立即通知老师或实验室负责人', '忽略它', '徒手擦拭', '只用纸盖住'],
    correctAnswer: 0,
    explanation: 'Chemical spills must be handled according to safety procedures.',
    explanationZh: '化学品泄漏必须按照安全流程处理。'
  },
  {
    id: 'safety-6',
    question: 'Which safety practice is correct for alcohol burners?',
    questionZh: '关于酒精灯，哪项安全做法是正确的？',
    options: ['Extinguish with the cap', 'Blow it out with your mouth', 'Refill while burning', 'Place beside organic solvents'],
    optionsZh: ['用灯帽盖灭', '用嘴吹灭', '燃烧时补充酒精', '放在有机溶剂旁边'],
    correctAnswer: 0,
    explanation: 'Capping the burner is safer and reduces the risk of flame spread.',
    explanationZh: '用灯帽盖灭更安全，可以降低火焰蔓延风险。'
  },
  {
    id: 'safety-7',
    question: 'What should students do before using unfamiliar equipment?',
    questionZh: '学生使用不熟悉的仪器前应该怎么做？',
    options: ['Read instructions and ask the instructor', 'Operate it directly', 'Guess the settings', 'Let another student try first'],
    optionsZh: ['阅读说明并询问老师', '直接操作', '猜测参数', '让其他同学先试'],
    correctAnswer: 0,
    explanation: 'Training and instructions reduce equipment damage and safety risks.',
    explanationZh: '培训和说明可以减少仪器损坏和安全风险。'
  },
  {
    id: 'safety-8',
    question: 'Why must laboratory benches be kept clean?',
    questionZh: '为什么实验台必须保持整洁？',
    options: ['To reduce contamination and accidents', 'To make the lab look empty', 'To avoid using equipment', 'To save electricity'],
    optionsZh: ['减少污染和事故', '让实验室看起来空旷', '避免使用仪器', '节省电力'],
    correctAnswer: 0,
    explanation: 'A clean workspace improves safety and experimental reliability.',
    explanationZh: '整洁的工作区可以提高安全性和实验可靠性。'
  },
  {
    id: 'safety-9',
    question: 'What should you do if you break glassware in the laboratory?',
    questionZh: '如果在实验室打碎玻璃器皿，应该怎么做？',
    options: ['Notify the instructor and use proper cleanup tools', 'Pick it up with bare hands', 'Leave it on the floor', 'Push it into the sink'],
    optionsZh: ['通知老师并使用正确工具清理', '徒手捡起', '留在地上', '推入水槽'],
    correctAnswer: 0,
    explanation: 'Broken glass can cause injury and must be handled using proper safety procedures.',
    explanationZh: '碎玻璃可能造成伤害，必须按照安全流程处理。'
  },
  {
    id: 'safety-10',
    question: 'Why should long hair be tied back in the laboratory?',
    questionZh: '为什么在实验室应将长发扎起？',
    options: ['To prevent contact with flames, chemicals, or equipment', 'To improve eyesight', 'To save time', 'To avoid using gloves'],
    optionsZh: ['防止接触火焰、化学品或仪器', '改善视力', '节省时间', '避免戴手套'],
    correctAnswer: 0,
    explanation: 'Loose hair can create safety risks near flames, chemicals, and moving equipment.',
    explanationZh: '散开的长发在火焰、化学品和运转设备附近会造成安全风险。'
  }
];

const equipmentQuestions: QuizQuestion[] = [
  {
    id: 'equipment-1',
    question: 'When using a centrifuge, what is the most important safety step?',
    questionZh: '使用离心机时，最重要的安全步骤是什么？',
    options: ['Set the highest speed', 'Balance tubes opposite each other', 'Open the lid immediately', 'Use only one tube'],
    optionsZh: ['设置最高速度', '将试管相对放置以保持平衡', '停止后立即打开盖子', '只使用一根试管'],
    correctAnswer: 1,
    explanation: 'Unbalanced centrifuges can vibrate strongly and become dangerous.',
    explanationZh: '不平衡的离心机会剧烈振动并产生危险。'
  },
  {
    id: 'equipment-2',
    question: 'To aspirate liquid with a micropipette, the plunger should be pressed to:',
    questionZh: '使用微量移液枪吸取液体时，应将按钮按至：',
    options: ['First stop', 'Second stop', 'All the way down', 'Halfway only'],
    optionsZh: ['第一档', '第二档', '按到底', '只按一半'],
    correctAnswer: 0,
    explanation: 'The first stop is used for aspiration; the second stop is used for dispensing.',
    explanationZh: '第一档用于吸取液体，第二档用于排出液体。'
  },
  {
    id: 'equipment-3',
    question: 'Before increasing microscope magnification, what should be done first?',
    questionZh: '提高显微镜倍率前，首先应该做什么？',
    options: ['Center and focus the specimen at low magnification', 'Switch to the highest objective immediately', 'Turn off the light', 'Remove the slide'],
    optionsZh: ['先在低倍下将样本居中并调焦', '直接切换到最高倍物镜', '关闭光源', '取下载玻片'],
    correctAnswer: 0,
    explanation: 'Starting at low magnification helps locate the specimen and prevents losing the field of view.',
    explanationZh: '先用低倍镜有助于找到样本并避免丢失视野。'
  },
  {
    id: 'equipment-4',
    question: 'What should be done after using an oil-immersion objective?',
    questionZh: '使用油镜后应该怎么做？',
    options: ['Clean the lens promptly with lens paper', 'Leave oil to dry', 'Rinse with tap water', 'Store with oil on the lens'],
    optionsZh: ['及时用擦镜纸清洁镜头', '让油自然风干', '用自来水冲洗', '带油直接收纳'],
    correctAnswer: 0,
    explanation: 'Residual oil can harden and reduce optical performance.',
    explanationZh: '残留镜油可能硬化并影响成像质量。'
  },
  {
    id: 'equipment-5',
    question: 'Why should bubbles be avoided in microplate reader assays?',
    questionZh: '使用酶标仪检测时为什么要避免气泡？',
    options: ['They interfere with optical readings', 'They increase temperature', 'They sterilize samples', 'They improve fluorescence'],
    optionsZh: ['会干扰光学读数', '会提高温度', '会给样品灭菌', '会增强荧光'],
    correctAnswer: 0,
    explanation: 'Bubbles scatter light and distort absorbance or fluorescence measurements.',
    explanationZh: '气泡会散射光线，影响吸光度或荧光读数。'
  },
  {
    id: 'equipment-6',
    question: 'What is the main purpose of a gel imaging system?',
    questionZh: '凝胶成像系统的主要用途是什么？',
    options: ['Document and analyze gels', 'Sterilize culture media', 'Weigh samples', 'Store frozen reagents'],
    optionsZh: ['记录并分析凝胶', '灭菌培养基', '称量样品', '冷冻保存试剂'],
    correctAnswer: 0,
    explanation: 'Gel imaging systems capture nucleic acid or protein gel results.',
    explanationZh: '凝胶成像系统用于采集核酸或蛋白凝胶结果。'
  },
  {
    id: 'equipment-7',
    question: 'What should be checked before using an electronic balance?',
    questionZh: '使用电子天平前应该检查什么？',
    options: ['Whether it is level and clean', 'Whether the door is open', 'Whether it is wet', 'Whether it is overloaded'],
    optionsZh: ['是否水平且干净', '门是否打开', '是否潮湿', '是否超载'],
    correctAnswer: 0,
    explanation: 'A level and clean balance improves weighing accuracy.',
    explanationZh: '水平且清洁的天平可以提高称量准确性。'
  },
  {
    id: 'equipment-8',
    question: 'What is the correct practice when using a water bath?',
    questionZh: '使用恒温水浴锅时正确的做法是什么？',
    options: ['Check water level before heating', 'Heat without water', 'Touch hot water directly', 'Use sealed containers only'],
    optionsZh: ['加热前检查水位', '无水加热', '直接触摸热水', '只能使用密闭容器'],
    correctAnswer: 0,
    explanation: 'Proper water level prevents dry heating and equipment damage.',
    explanationZh: '合适的水位可以防止干烧和设备损坏。'
  },
  {
    id: 'equipment-9',
    question: 'Why should a centrifuge lid remain closed until the rotor fully stops?',
    questionZh: '为什么离心机转子完全停止前不能打开盖子？',
    options: ['To prevent injury from moving parts', 'To make samples warmer', 'To increase speed', 'To reduce sample labels'],
    optionsZh: ['防止运动部件造成伤害', '让样品变暖', '提高速度', '减少样品标签'],
    correctAnswer: 0,
    explanation: 'Opening the centrifuge before it stops can be dangerous because the rotor is still moving.',
    explanationZh: '离心机未完全停止时打开盖子很危险，因为转子仍在高速运动。'
  },
  {
    id: 'equipment-10',
    question: 'What should be done before using a spectrophotometer?',
    questionZh: '使用分光光度计前应该做什么？',
    options: ['Warm up the instrument and prepare a blank', 'Shake the machine', 'Skip calibration', 'Use dirty cuvettes'],
    optionsZh: ['预热仪器并准备空白对照', '摇晃仪器', '跳过校准', '使用脏比色皿'],
    correctAnswer: 0,
    explanation: 'Warm-up and blank correction improve measurement accuracy.',
    explanationZh: '预热和空白校正可以提高测量准确性。'
  }
];

const molecularQuestions: QuizQuestion[] = [
  {
    id: 'molecular-1',
    question: 'Which instrument is most suitable for quantitative gene-expression analysis?',
    questionZh: '哪种仪器最适合进行基因表达定量分析？',
    options: ['Real-time PCR system', 'Electronic balance', 'Water bath', 'Dissecting microscope'],
    optionsZh: ['实时荧光定量 PCR 仪', '电子天平', '恒温水浴锅', '解剖显微镜'],
    correctAnswer: 0,
    explanation: 'Real-time PCR is used for fluorescence-based nucleic acid quantification.',
    explanationZh: '实时荧光定量 PCR 用于基于荧光信号的核酸定量。'
  },
  {
    id: 'molecular-2',
    question: 'What is the purpose of electrophoresis?',
    questionZh: '电泳的目的是什么？',
    options: ['Separate DNA or proteins by size/charge', 'Heat samples evenly', 'Weigh reagents', 'Store samples'],
    optionsZh: ['按大小或电荷分离 DNA 或蛋白质', '均匀加热样品', '称量试剂', '保存样品'],
    correctAnswer: 0,
    explanation: 'Electrophoresis separates molecules under an electric field.',
    explanationZh: '电泳利用电场分离分子。'
  },
  {
    id: 'molecular-3',
    question: 'Why should PCR reaction preparation avoid contamination?',
    questionZh: '为什么 PCR 反应配制要避免污染？',
    options: ['Contamination can cause false-positive results', 'It increases sample color', 'It improves amplification', 'It reduces electricity use'],
    optionsZh: ['污染可能导致假阳性结果', '会增加样品颜色', '会改善扩增', '会减少用电'],
    correctAnswer: 0,
    explanation: 'Even small amounts of contaminating DNA can be amplified.',
    explanationZh: '少量污染 DNA 也可能被扩增出来。'
  },
  {
    id: 'molecular-4',
    question: 'What does a spectrophotometer commonly measure?',
    questionZh: '分光光度计通常测量什么？',
    options: ['Absorbance', 'Weight', 'Temperature', 'Pressure'],
    optionsZh: ['吸光度', '重量', '温度', '压力'],
    correctAnswer: 0,
    explanation: 'Spectrophotometers measure how much light a sample absorbs.',
    explanationZh: '分光光度计测量样品吸收光的程度。'
  },
  {
    id: 'molecular-5',
    question: 'What is a key reason to use sterile pipette tips?',
    questionZh: '使用无菌吸头的关键原因是什么？',
    options: ['Prevent contamination', 'Increase sample weight', 'Change pH automatically', 'Heat the sample'],
    optionsZh: ['防止污染', '增加样品重量', '自动改变 pH', '加热样品'],
    correctAnswer: 0,
    explanation: 'Sterile tips reduce cross-contamination between samples.',
    explanationZh: '无菌吸头可以减少样品间交叉污染。'
  },
  {
    id: 'molecular-6',
    question: 'Which instrument is used to separate samples by spinning at high speed?',
    questionZh: '哪种仪器通过高速旋转分离样品？',
    options: ['Centrifuge', 'Microscope', 'Water bath', 'Microplate reader'],
    optionsZh: ['离心机', '显微镜', '恒温水浴锅', '酶标仪'],
    correctAnswer: 0,
    explanation: 'Centrifuges use centrifugal force to separate sample components.',
    explanationZh: '离心机利用离心力分离样品组分。'
  },
  {
    id: 'molecular-7',
    question: 'What should be recorded when running an experiment?',
    questionZh: '进行实验时应该记录什么？',
    options: ['Conditions, samples, and results', 'Only the final answer', 'Only the instrument name', 'Nothing if the result looks good'],
    optionsZh: ['实验条件、样品和结果', '只记录最终答案', '只记录仪器名称', '结果看起来好就不用记录'],
    correctAnswer: 0,
    explanation: 'Complete records improve reproducibility and troubleshooting.',
    explanationZh: '完整记录有助于实验重复和问题排查。'
  },
  {
    id: 'molecular-8',
    question: 'Why are controls important in biological experiments?',
    questionZh: '为什么生物实验中对照组很重要？',
    options: ['They help interpret whether results are valid', 'They replace all samples', 'They make equipment unnecessary', 'They remove the need for records'],
    optionsZh: ['帮助判断结果是否有效', '替代所有样品', '使仪器不再需要', '不再需要记录'],
    correctAnswer: 0,
    explanation: 'Controls provide a comparison for evaluating experimental results.',
    explanationZh: '对照组为评估实验结果提供比较基础。'
  },
  {
    id: 'molecular-9',
    question: 'Why should DNA samples be kept cold during preparation?',
    questionZh: '为什么 DNA 样品制备过程中通常需要保持低温？',
    options: ['To reduce degradation', 'To make them colorful', 'To increase contamination', 'To stop labeling'],
    optionsZh: ['减少降解', '让样品变色', '增加污染', '停止标记'],
    correctAnswer: 0,
    explanation: 'Low temperature helps protect biological samples from degradation.',
    explanationZh: '低温有助于保护生物样品，减少降解。'
  },
  {
    id: 'molecular-10',
    question: 'What is the purpose of using a negative control in PCR?',
    questionZh: 'PCR 中设置阴性对照的目的是什么？',
    options: ['To check for contamination', 'To increase DNA concentration', 'To replace primers', 'To heat the sample faster'],
    optionsZh: ['检查是否有污染', '提高 DNA 浓度', '替代引物', '让样品更快升温'],
    correctAnswer: 0,
    explanation: 'A negative control helps detect contamination in PCR reactions.',
    explanationZh: '阴性对照可以帮助检测 PCR 反应中的污染。'
  }
];

export const quizQuestions: QuizQuestion[] = [
  ...safetyQuestions,
  ...equipmentQuestions,
  ...molecularQuestions
];

export const quizSets: QuizSet[] = [
  {
    id: 'safety',
    title: 'Laboratory Safety Access Test',
    titleZh: '实验室安全准入测试',
    description: 'Test essential laboratory safety rules before entering the lab.',
    descriptionZh: '测试进入实验室前必须掌握的基础安全规范。',
    questions: safetyQuestions
  },
  {
    id: 'equipment',
    title: 'Equipment Operation Test',
    titleZh: '仪器使用测试',
    description: 'Test standard operation knowledge for common laboratory equipment.',
    descriptionZh: '测试常见实验仪器的标准操作知识。',
    questions: equipmentQuestions
  },
  {
    id: 'molecular',
    title: 'Molecular Biology Test',
    titleZh: '分子生物学实验测试',
    description: 'Test basic knowledge of molecular biology laboratory procedures.',
    descriptionZh: '测试分子生物学实验基本操作知识。',
    questions: molecularQuestions
  },
  {
    id: 'comprehensive',
    title: 'Comprehensive BioLab Test',
    titleZh: '综合生物实验测试',
    description: 'A mixed test covering safety, equipment, and molecular biology procedures.',
    descriptionZh: '综合测试安全、仪器和分子生物学实验操作流程。',
    questions: quizQuestions
  }
];
