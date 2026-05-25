-- ============================================
-- WKU 生物实验器材教学系统 - 完整数据库
-- 基础设备(17台) + 高端仪器(23台) = 共40台
-- 包含全部40台设备的操作步骤（中英文）
-- ============================================

-- ============================================
-- 1. 器材主表
-- ============================================
CREATE TABLE IF NOT EXISTS equipment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(500)
);

-- ============================================
-- 2. 器材翻译表（中英文）
-- ============================================
CREATE TABLE IF NOT EXISTS equipment_translations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT NOT NULL,
    language_code VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    purpose TEXT,
    usage_scenario TEXT,
    precautions TEXT,
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE
);

-- ============================================
-- 3. 操作步骤表
-- ============================================
CREATE TABLE IF NOT EXISTS operation_steps (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT,
    step_order INT NOT NULL,
    language_code VARCHAR(10) NOT NULL,
    description TEXT NOT NULL,
    tip TEXT,
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE
);

-- ============================================
-- 4. 学生表
-- ============================================
CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_number VARCHAR(30) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- 5. 测试记录表
-- ============================================
CREATE TABLE IF NOT EXISTS quiz_attempts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    quiz_type VARCHAR(50) NOT NULL DEFAULT 'general',
    score INT NOT NULL,
    total_questions INT NOT NULL,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

-- ============================================
-- 6. 每题作答记录表
-- ============================================
CREATE TABLE IF NOT EXISTS quiz_answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    attempt_id INT NOT NULL,
    question_id VARCHAR(50) NOT NULL,
    selected_answer INT NOT NULL,
    is_correct BOOLEAN NOT NULL,
    FOREIGN KEY (attempt_id) REFERENCES quiz_attempts(id) ON DELETE CASCADE
);

-- ============================================
-- 示例学生账号
-- 密码分别为：wku123 / biolab123
-- ============================================
INSERT IGNORE INTO students (id, student_number, name, password_hash) VALUES
(1, '20260001', '张同学', SHA2('wku123', 256)),
(2, '20260002', '李同学', SHA2('biolab123', 256));

-- ============================================
-- 插入器材基础信息（共40台）
-- ============================================
INSERT IGNORE INTO equipment (id, image_url) VALUES
(1, '/images/microscope.jpg'),
(2, '/images/dissecting.jpg'),
(3, '/images/balance.jpg'),
(4, '/images/pipette.jpg'),
(5, '/images/waterbath.jpg'),
(6, '/images/spectrophotometer.jpg'),
(7, '/images/centrifuge.jpg'),
(8, '/images/gelimaging.jpg'),
(9, '/images/electrophoresis.jpg'),
(10, '/images/incubator.jpg'),
(11, '/images/refrigerator.jpg'),
(12, '/images/microwave.jpg'),
(13, '/images/alcoholburner.jpg'),
(14, '/images/oilimmersion.jpg'),
(15, '/images/co2chamber.jpg'),
(16, '/images/warmingplate.jpg'),
(17, '/images/co2asphyxiation.jpg'),
(18, '/images/inverted_fluorescence.jpg'),
(19, '/images/microplate_reader1.jpg'),
(20, '/images/microplate_reader2.jpg'),
(21, '/images/gel_imaging_biorad.jpg'),
(22, '/images/inverted_fluorescence_nikon.jpg'),
(23, '/images/qpcr_roche.jpg'),
(24, '/images/qpcr_abi.jpg'),
(25, '/images/ultra_centrifuge.jpg'),
(26, '/images/infrared_imaging.jpg'),
(27, '/images/confocal_zeiss.jpg'),
(28, '/images/atomic_absorption.jpg'),
(29, '/images/hplc_waters.jpg'),
(30, '/images/nanoparticle_analyzer.jpg'),
(31, '/images/ftir.jpg'),
(32, '/images/uplc_agilent.jpg'),
(33, '/images/gc_thermo.jpg'),
(34, '/images/flow_cytometer.jpg'),
(35, '/images/cluster.jpg'),
(36, '/images/lcms_waters.jpg'),
(37, '/images/fplc_biorad.jpg'),
(38, '/images/uv_nir.jpg'),
(39, '/images/qpcr_quantstudio.jpg'),
(40, '/images/nmr_magritek.jpg');

-- ============================================
-- 插入中文器材数据（1-17 基础设备）
-- ============================================
INSERT IGNORE INTO equipment_translations (equipment_id, language_code, name, purpose, usage_scenario, precautions) VALUES
(1, 'zh-CN', '光学显微镜', '观察微小物体和细胞结构', '细胞、组织、微生物观察', '避免镜头污染，使用专用擦镜纸，油镜用后需清洁'),
(2, 'zh-CN', '解剖显微镜', '观察较大标本的三维结构', '解剖实验、整体观察', '轻拿轻放，避免碰撞'),
(3, 'zh-CN', '电子天平', '精确称量试剂质量', '配制溶液、称量药品', '不可超载，避免液体洒落，使用后清洁'),
(4, 'zh-CN', '移液器', '精确量取微量液体', 'DNA/蛋白质实验、溶液配制', '不可倒置，避免液体进入枪体，定期校准'),
(5, 'zh-CN', '恒温水浴锅', '维持恒定温度加热液体', '解冻试剂、保温反应', '定期换水，避免干烧，注意烫伤'),
(6, 'zh-CN', '分光光度计', '测量溶液吸光度', '浓度测定、酶活检测', '比色皿需清洁，避免刮伤光学面'),
(7, 'zh-CN', '离心机', '利用离心力分离样品', '沉淀细胞、分离上清液', '必须平衡，盖子盖紧，停止前勿打开'),
(8, 'zh-CN', '凝胶成像系统', '拍摄和分析凝胶电泳结果', 'DNA/蛋白凝胶拍照', '避免紫外光直接照射眼睛，戴防护面罩'),
(9, 'zh-CN', '电泳仪', '提供电场分离DNA/蛋白质', 'DNA电泳、蛋白电泳', '注意正负极，避免触电，缓冲液覆盖凝胶'),
(10, 'zh-CN', '恒温培养箱', '恒温培养微生物或细胞', '细菌培养、细胞培养', '定期清洁，避免污染，注意勿超载'),
(11, 'zh-CN', '冰箱', '低温保存试剂和样品', '酶、抗体、样品保存', '定期除霜，不同温度分区存放，避免反复冻融'),
(12, 'zh-CN', '微波炉', '快速加热溶液或融化琼脂', '配制培养基、融化琼脂', '不可加热密闭容器，取出时防烫伤'),
(13, 'zh-CN', '酒精灯', '提供明火加热或灭菌', '接种环灭菌、加热', '易燃，远离有机溶剂，不可吹灭'),
(14, 'zh-CN', '油镜', '100倍油镜观察细菌等微小结构', '细菌染色观察', '油镜用后必须立即清洁，避免干涸'),
(15, 'zh-CN', 'CO₂麻醉箱', '对实验动物进行CO₂安乐死', '动物处死', '操作需经动物伦理批准，避免动物痛苦'),
(16, 'zh-CN', '恒温加热板', '维持恒定温度加热表面', '动物手术、解冻', '避免烫伤，定期清洁'),
(17, 'zh-CN', '二氧化碳窒息装置', '对实验动物进行CO₂窒息处死', '动物处死', '需经动物伦理批准，操作规范，避免动物痛苦');

-- ============================================
-- 插入中文器材数据（18-40 高端仪器）
-- ============================================
INSERT IGNORE INTO equipment_translations (equipment_id, language_code, name, purpose, usage_scenario, precautions) VALUES
(18, 'zh-CN', '一体式倒置荧光显微镜', '荧光标记样本观察与高分辨率成像，支持活细胞长时间动态监测', '细胞荧光标记观察、活细胞成像、组织切片荧光分析', '使用前预热，避免强光长时间照射样品导致荧光淬灭，镜头保持清洁'),
(19, 'zh-CN', '多功能酶标仪', '微孔板光吸收、荧光、化学发光等多种模式检测', 'ELISA实验、蛋白定量、细胞活力检测、酶活性测定', '使用前校准，避免气泡影响读数，保持光路清洁，使用专用微孔板'),
(20, 'zh-CN', '酶标仪', '微孔板光吸收检测，支持紫外-可见光范围', 'ELISA、蛋白浓度测定、细胞增殖检测', '使用前预热，避免边缘效应，加样时避免产生气泡'),
(21, 'zh-CN', '凝胶成像系统', '化学发光、荧光及比色法凝胶成像与定量分析', 'Western Blot成像、DNA/蛋白凝胶成像、斑点杂交分析', '避免紫外光直接照射眼睛，使用化学发光试剂时注意避光，定期校准'),
(22, 'zh-CN', '倒置荧光显微镜', '活细胞荧光成像、相差观察，适用于培养细胞实时监测', '细胞培养观察、转染效率评估、钙成像实验', '物镜使用后清洁，避免培养基污染镜头，使用后关闭光源'),
(23, 'zh-CN', '实时荧光定量PCR仪', '实时监测PCR扩增过程，进行基因表达定量分析', '基因表达检测、miRNA定量、病原体检测、SNP分型', '避免核酸污染，使用专用耗材，设置合适对照，定期维护'),
(24, 'zh-CN', '荧光定量PCR系统', '高通量实时荧光定量PCR，支持多重荧光检测', '基因表达分析、拷贝数变异检测、微生物定量', '反应体系配制需在洁净区，避免交叉污染，定期校准温度'),
(25, 'zh-CN', '超高速冷冻离心机', '超高速离心分离亚细胞结构、病毒颗粒及大分子复合物', '亚细胞器分离、病毒纯化、外泌体提取、质粒大量制备', '必须严格配平，使用专用转子，不可超过转子最大转速，离心后检查样品'),
(26, 'zh-CN', '双色红外激光成像系统', '双通道红外激光检测，实现Western Blot精确定量', '蛋白表达定量、磷酸化蛋白检测、蛋白质相互作用分析', '使用专用膜和试剂，避免信号饱和，定期校准激光强度'),
(27, 'zh-CN', '激光共聚焦显微镜', '高分辨率三维荧光成像，支持光学切片和共定位分析', '细胞结构观察、荧光共定位、时间序列成像、FRAP实验', '激光防护，避免直视激光，使用合适物镜和参数，定期维护'),
(28, 'zh-CN', '原子吸收光谱仪', '金属元素定量分析，支持火焰和石墨炉模式', '重金属检测、微量元素测定、环境样品分析', '使用空心阴极灯，定期校准曲线，样品需消解处理，注意通风'),
(29, 'zh-CN', '高效液相色谱仪', '化合物分离、定性和定量分析', '药物分析、代谢物检测、天然产物分离、质量检测', '使用前排气，流动相需过滤脱气，定期维护色谱柱，使用后冲洗系统'),
(30, 'zh-CN', '纳米粒度分析仪', '动态光散射法测量纳米颗粒粒径、Zeta电位', '纳米材料表征、蛋白质聚集分析、脂质体粒径测定', '样品需过滤除尘，避免气泡，测量前平衡温度，清洁比色皿'),
(31, 'zh-CN', '同步热分析-红外光谱联用仪', '热重分析和差示扫描量热与红外光谱联用，分析热分解产物', '材料热稳定性分析、分解机理研究、组分鉴定', '样品需干燥，气体流速稳定，定期校准温度和红外光谱'),
(32, 'zh-CN', '超高效液相色谱仪', '超高压快速高效分离，提高分辨率和灵敏度', '复杂样品分析、代谢组学、药物杂质检测', '使用UPLC专用色谱柱，样品需过滤，控制柱温，定期维护'),
(33, 'zh-CN', '气相色谱仪', '挥发性化合物分离分析', '挥发性有机物的测定、残留溶剂检测、脂肪酸分析', '使用前检漏，载气纯度需达标，程序升温需优化，定期老化色谱柱'),
(34, 'zh-CN', '流式细胞仪', '细胞多参数分析，包括细胞表型、细胞周期、凋亡检测', '免疫细胞分析、干细胞鉴定、细胞周期检测、细胞凋亡测定', '样品需过滤为单细胞悬液，避光保存染色样本，每天清洗管路'),
(35, 'zh-CN', '计算机集群', '大规模数据计算和存储，支持生物信息学分析', '基因组组装、转录组分析、蛋白质结构预测、分子动力学模拟', '合理分配计算资源，定期备份数据，注意散热和电力管理'),
(36, 'zh-CN', '超高效液相色谱-质谱联用仪', '高灵敏度化合物分离与鉴定，支持定性和定量分析', '代谢组学、蛋白质组学、药物代谢动力学分析、残留检测', '使用高纯度溶剂，保持质谱真空度，定期校准质量轴，避免盐分进入'),
(37, 'zh-CN', '蛋白纯化系统', '自动化的蛋白质分离纯化，支持多波长检测和梯度洗脱', '重组蛋白纯化、抗体纯化、酶分离、亲和层析', '使用前平衡柱子，避免气泡进入系统，样品需过滤，使用后清洗层析柱'),
(38, 'zh-CN', '紫外可见光近红外光谱仪', '宽波长范围光谱扫描，用于材料光学性能分析', '带隙测定、薄膜透射/反射测试、光学常数分析', '使用前预热，空白校正，避免样品过浓，保持光路清洁'),
(39, 'zh-CN', '高通量荧光定量PCR', '高通量实时荧光定量PCR，支持96孔和384孔板', '大规模基因表达筛选、miRNA表达谱分析、病原体高通量检测', '避免污染，使用自动化加样系统，设置多个复孔，定期校准'),
(40, 'zh-CN', '台式核磁共振波谱仪', '分子结构解析、反应监测、定量分析，台式设计操作简便', '化合物结构鉴定、化学反应动力学研究、混合物定量分析', '使用专用核磁管，样品需溶解澄清，保持磁场稳定，温度恒定');

-- ============================================
-- 插入英文器材数据（1-17 基础设备）
-- ============================================
INSERT IGNORE INTO equipment_translations (equipment_id, language_code, name, purpose, usage_scenario, precautions) VALUES
(1, 'en-US', 'Light Microscope', 'Observe small objects and cell structures', 'Cell, tissue, microorganism observation', 'Avoid lens contamination, use special lens paper, clean oil immersion lens after use'),
(2, 'en-US', 'Dissecting Microscope', 'Observe 3D structure of larger specimens', 'Dissection, specimen observation', 'Handle gently, avoid bumping'),
(3, 'en-US', 'Electronic Balance', 'Accurately weigh reagent mass', 'Solution preparation, weighing chemicals', 'Do not overload, avoid liquid spills, clean after use'),
(4, 'en-US', 'Pipette Gun', 'Accurately measure microliter volumes', 'DNA/protein experiments, solution preparation', 'Do not invert, avoid liquid entering the body, calibrate regularly'),
(5, 'en-US', 'Constant-temperature Water Bath', 'Maintain constant temperature for heating liquids', 'Thawing reagents, incubation reactions', 'Change water regularly, avoid dry heating, watch for burns'),
(6, 'en-US', 'Spectrophotometer', 'Measure solution absorbance', 'Concentration determination, enzyme activity assay', 'Keep cuvettes clean, avoid scratching optical surfaces'),
(7, 'en-US', 'Centrifuge', 'Separate samples using centrifugal force', 'Cell pelleting, supernatant separation', 'Must balance, close lid tightly, do not open until fully stopped'),
(8, 'en-US', 'Gel Imaging System', 'Capture and analyze gel electrophoresis results', 'DNA/protein gel documentation', 'Avoid direct UV exposure, wear face shield'),
(9, 'en-US', 'Electrophoresis Apparatus', 'Provide electric field to separate DNA/proteins', 'DNA electrophoresis, protein electrophoresis', 'Mind electrode polarity, avoid electric shock, cover gel with buffer'),
(10, 'en-US', 'Constant-temperature Incubator', 'Culture microorganisms or cells at constant temperature', 'Bacteria culture, cell culture', 'Clean regularly, avoid contamination, do not overload'),
(11, 'en-US', 'Refrigerator', 'Store reagents and samples at low temperature', 'Enzyme, antibody, sample storage', 'Defrost regularly, store at appropriate temperature zones, avoid freeze-thaw cycles'),
(12, 'en-US', 'Microwave Oven', 'Quickly heat solutions or melt agar', 'Media preparation, agar melting', 'Do not heat sealed containers, be careful of burns when removing'),
(13, 'en-US', 'Alcohol Burner', 'Provide open flame for heating or sterilization', 'Inoculating loop sterilization, heating', 'Flammable, keep away from organic solvents, do not blow out'),
(14, 'en-US', 'Oil-immersion Objective', '100x oil lens for observing bacteria and small structures', 'Bacterial staining observation', 'Clean immediately after use, avoid drying'),
(15, 'en-US', 'CO₂ Anesthesia Chamber', 'CO₂ euthanasia for experimental animals', 'Animal euthanasia', 'Requires animal ethics approval, avoid animal suffering'),
(16, 'en-US', 'Warming Plate', 'Maintain constant temperature for heating surfaces', 'Animal surgery, thawing', 'Avoid burns, clean regularly'),
(17, 'en-US', 'CO₂ Asphyxiation Equipment', 'CO₂ asphyxiation for experimental animals', 'Animal euthanasia', 'Requires animal ethics approval, follow standard procedures, avoid animal suffering');

-- ============================================
-- 插入英文器材数据（18-40 高端仪器）
-- ============================================
INSERT IGNORE INTO equipment_translations (equipment_id, language_code, name, purpose, usage_scenario, precautions) VALUES
(18, 'en-US', 'Integrated Inverted Fluorescence Microscope', 'Fluorescence observation and high-resolution imaging of live cells', 'Fluorescence imaging, live-cell tracking, tissue section analysis', 'Preheat before use, avoid prolonged exposure to prevent photobleaching, keep lens clean'),
(19, 'en-US', 'Multi-mode Microplate Reader', 'Absorbance, fluorescence, and luminescence detection in microplates', 'ELISA, protein quantification, cell viability assays, enzyme activity', 'Calibrate before use, avoid bubbles, keep optical path clean'),
(20, 'en-US', 'Microplate Reader', 'UV-Vis absorbance detection in microplates', 'ELISA, protein concentration, cell proliferation assays', 'Preheat before use, avoid edge effects, dispense without bubbles'),
(21, 'en-US', 'Gel Imaging System', 'Chemiluminescence, fluorescence, and colorimetric gel imaging and analysis', 'Western Blot, DNA/protein gel imaging, dot blot analysis', 'Avoid direct UV exposure, use chemical reagents away from light, calibrate regularly'),
(22, 'en-US', 'Inverted Fluorescence Microscope', 'Live-cell fluorescence and phase contrast imaging', 'Cell culture observation, transfection efficiency, calcium imaging', 'Clean objective after use, turn off light source after use'),
(23, 'en-US', 'Real-time Quantitative PCR System', 'Real-time PCR monitoring and gene expression quantification', 'Gene expression, miRNA quantification, pathogen detection, SNP genotyping', 'Avoid nucleic acid contamination, use appropriate consumables, set proper controls'),
(24, 'en-US', 'Quantitative PCR System', 'High-throughput real-time PCR with multiplex detection', 'Gene expression analysis, copy number variation, microbial quantification', 'Prepare reactions in clean area, avoid cross-contamination, calibrate temperature regularly'),
(25, 'en-US', 'Ultra-speed Refrigerated Centrifuge', 'Ultracentrifugation for subcellular fractionation and virus purification', 'Organelle isolation, virus purification, exosome extraction, plasmid preparation', 'Must balance precisely, use proper rotor, do not exceed maximum speed'),
(26, 'en-US', 'Two-color Infrared Laser Imaging System', 'Two-channel infrared detection for quantitative Western Blot', 'Protein quantification, phosphorylation detection, protein-protein interaction', 'Use specific membranes and reagents, avoid signal saturation, calibrate lasers regularly'),
(27, 'en-US', 'Laser Confocal Microscope', 'High-resolution 3D fluorescence imaging with optical sectioning', 'Cell structure imaging, colocalization analysis, time-lapse imaging, FRAP', 'Laser safety, avoid direct exposure, use proper parameters, regular maintenance'),
(28, 'en-US', 'Atomic Absorption Spectrometer', 'Quantitative analysis of metal elements', 'Heavy metal detection, trace element analysis, environmental samples', 'Use hollow cathode lamp, calibrate regularly, digest samples, ensure ventilation'),
(29, 'en-US', 'High Performance Liquid Chromatography', 'Compound separation, qualitative and quantitative analysis', 'Pharmaceutical analysis, metabolite detection, natural product isolation, quality control', 'Degas mobile phase, filter and degas solvents, maintain column regularly, flush system after use'),
(30, 'en-US', 'Nanoparticle Size Analyzer', 'Dynamic light scattering for particle size and Zeta potential measurement', 'Nanomaterial characterization, protein aggregation analysis, liposome sizing', 'Filter samples to remove dust, avoid bubbles, equilibrate temperature, clean cuvette'),
(31, 'en-US', 'STA-FTIR Analyzer', 'TGA-DSC coupled with FTIR for decomposition product analysis', 'Thermal stability analysis, decomposition mechanism study, component identification', 'Dry samples, stabilize gas flow, calibrate temperature and IR regularly'),
(32, 'en-US', 'Ultra Performance Liquid Chromatography', 'High-pressure fast separation with improved resolution and sensitivity', 'Complex sample analysis, metabolomics, impurity detection', 'Use UPLC-specific columns, filter samples, control column temperature, regular maintenance'),
(33, 'en-US', 'Gas Chromatography', 'Separation and analysis of volatile compounds', 'VOC analysis, residual solvent detection, fatty acid analysis', 'Leak check before use, use high purity carrier gas, optimize temperature program, regular column aging'),
(34, 'en-US', 'Flow Cytometer', 'Multi-parameter cell analysis including phenotyping, cell cycle, apoptosis', 'Immunophenotyping, stem cell analysis, cell cycle analysis, apoptosis assay', 'Prepare single-cell suspension, protect stained samples from light, clean fluidics daily'),
(35, 'en-US', 'Computer Cluster', 'Large-scale computation and storage for bioinformatics analysis', 'Genome assembly, transcriptomics, protein structure prediction, molecular dynamics simulation', 'Allocate resources properly, backup data regularly, manage cooling and power'),
(36, 'en-US', 'UPLC-MS/MS System', 'High-sensitivity compound separation and identification with qualitative and quantitative analysis', 'Metabolomics, proteomics, pharmacokinetics, residue detection', 'Use high-purity solvents, maintain vacuum, calibrate mass axis regularly, avoid salts'),
(37, 'en-US', 'Protein Purification System', 'Automated protein purification with gradient elution and multi-wavelength detection', 'Recombinant protein purification, antibody purification, enzyme separation, affinity chromatography', 'Equilibrate column before use, avoid bubbles, filter samples, clean column after use'),
(38, 'en-US', 'UV-Vis-NIR Spectrometer', 'Broad-range spectroscopy for material optical property analysis', 'Bandgap determination, film transmission/reflection measurement, optical constant analysis', 'Preheat before use, blank correction, avoid concentrated samples, keep optical path clean'),
(39, 'en-US', 'High-throughput qPCR System', 'High-throughput real-time PCR with 96/384-well plate support', 'Large-scale gene expression screening, miRNA profiling, high-throughput pathogen detection', 'Avoid contamination, use automated dispensing, set multiple replicates, calibrate regularly'),
(40, 'en-US', 'Benchtop NMR Spectrometer', 'Molecular structure analysis, reaction monitoring, quantitative analysis with benchtop design', 'Compound identification, chemical reaction kinetics, mixture quantification', 'Use NMR tubes, dissolve samples clearly, maintain stable magnetic field and temperature');

-- ============================================
-- 插入全部40台设备的操作步骤（中英文）
-- ============================================

-- 1. 光学显微镜 (id=1)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(1, 1, 'zh-CN', '将显微镜置于平稳桌面，接通电源', '避免强光直射目镜'),
(1, 2, 'zh-CN', '放置载玻片，用压片夹固定', '样本对准通光孔中心'),
(1, 3, 'zh-CN', '从低倍镜开始调焦，转动粗准焦螺旋', '勿让物镜接触玻片'),
(1, 4, 'zh-CN', '转动细准焦螺旋至图像清晰', '使用细准焦螺旋微调'),
(1, 5, 'zh-CN', '如需油镜，滴香柏油后观察，用后清洁', '油镜用后必须立即清洁'),
(1, 1, 'en-US', 'Place microscope on stable table, connect power', 'Avoid direct strong light into eyepiece'),
(1, 2, 'en-US', 'Place slide, secure with stage clips', 'Center specimen over light path'),
(1, 3, 'en-US', 'Start with low power objective, use coarse focus knob', 'Do not let lens touch slide'),
(1, 4, 'en-US', 'Use fine focus knob until image is clear', 'Use fine focus for precise adjustment'),
(1, 5, 'en-US', 'For oil immersion, apply oil, observe, then clean', 'Clean oil immersion lens immediately');

-- 2. 解剖显微镜 (id=2)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(2, 1, 'zh-CN', '将解剖显微镜置于平稳台面', '选择光线充足的位置'),
(2, 2, 'zh-CN', '放置标本于载物台中央', '可使用辅助光源照明'),
(2, 3, 'zh-CN', '调节双目镜筒距离', '使双眼视野重合为一个圆形'),
(2, 4, 'zh-CN', '转动调焦手轮至图像清晰', '粗调后可使用微调'),
(2, 5, 'zh-CN', '调节放大倍数观察细节', '从低倍到高倍逐步调节'),
(2, 1, 'en-US', 'Place dissecting microscope on stable table', 'Choose a well-lit location'),
(2, 2, 'en-US', 'Place specimen on stage center', 'Use auxiliary light if needed'),
(2, 3, 'en-US', 'Adjust binocular distance', 'Merge two fields into one circle'),
(2, 4, 'en-US', 'Turn focus knob until image is clear', 'Use fine focus after coarse adjustment'),
(2, 5, 'en-US', 'Adjust magnification to observe details', 'Increase gradually from low to high');

-- 3. 电子天平 (id=3)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(3, 1, 'zh-CN', '将天平置于平稳台面，开机预热15分钟', '避免震动和气流'),
(3, 2, 'zh-CN', '放置称量纸或容器，按归零键', '确保容器干燥清洁'),
(3, 3, 'zh-CN', '缓慢加入样品至所需质量', '避免过量'),
(3, 4, 'zh-CN', '读取稳定后的数值', '等待数字不再跳动'),
(3, 5, 'zh-CN', '取下样品，清洁称盘', '使用软刷清扫'),
(3, 1, 'en-US', 'Place balance on stable table, warm up for 15 min', 'Avoid vibration and air flow'),
(3, 2, 'en-US', 'Place weighing paper or container, press tare', 'Ensure container is dry and clean'),
(3, 3, 'en-US', 'Slowly add sample to desired weight', 'Avoid adding too much'),
(3, 4, 'en-US', 'Read stable value', 'Wait until numbers stop changing'),
(3, 5, 'en-US', 'Remove sample, clean weighing pan', 'Use soft brush to clean');

-- 4. 移液器 (id=4)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(4, 1, 'zh-CN', '选择合适量程的移液器和吸头', '使用量程范围内的体积'),
(4, 2, 'zh-CN', '将吸头牢固安装到移液器上', '轻轻旋转插入，勿用力过猛'),
(4, 3, 'zh-CN', '按下按钮至第一档，垂直浸入液面下2-3mm', '保持移液器垂直'),
(4, 4, 'zh-CN', '缓慢释放按钮吸取液体', '避免产生气泡'),
(4, 5, 'zh-CN', '将吸头尖端贴容器壁，按压至第二档排液', '确保全部液体排出'),
(4, 1, 'en-US', 'Select correct pipette and tip for volume range', 'Use volume within pipette range'),
(4, 2, 'en-US', 'Attach tip securely to pipette', 'Gently twist to attach, do not use excessive force'),
(4, 3, 'en-US', 'Press to first stop, immerse tip 2-3mm vertically', 'Keep pipette vertical'),
(4, 4, 'en-US', 'Release button slowly to aspirate liquid', 'Avoid bubbles'),
(4, 5, 'en-US', 'Touch tip to container wall, press to second stop to dispense', 'Ensure complete dispensing');

-- 5. 恒温水浴锅 (id=5)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(5, 1, 'zh-CN', '检查水位，加水至刻度线', '使用蒸馏水或去离子水'),
(5, 2, 'zh-CN', '设定所需温度', '根据实验要求设定'),
(5, 3, 'zh-CN', '等待温度稳定后再放入样品', '通常需要10-15分钟'),
(5, 4, 'zh-CN', '将样品容器放入水浴中', '使用浮漂固定试管'),
(5, 5, 'zh-CN', '实验结束后取出样品，关闭电源', '注意烫伤'),
(5, 1, 'en-US', 'Check water level, fill to mark line', 'Use distilled or deionized water'),
(5, 2, 'en-US', 'Set desired temperature', 'Follow experiment requirements'),
(5, 3, 'en-US', 'Wait for temperature to stabilize before adding samples', 'Usually takes 10-15 minutes'),
(5, 4, 'en-US', 'Place sample container into water bath', 'Use float to secure tubes'),
(5, 5, 'en-US', 'Remove samples after experiment, turn off power', 'Watch for burns');

-- 6. 分光光度计 (id=6)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(6, 1, 'zh-CN', '开机预热20分钟', '预热保证光源稳定'),
(6, 2, 'zh-CN', '设定检测波长', '根据实验要求设定'),
(6, 3, 'zh-CN', '放入空白对照，调零', '使用相同溶剂'),
(6, 4, 'zh-CN', '放入样品，读取吸光度值', '擦拭比色皿外壁'),
(6, 5, 'zh-CN', '记录数据，取出比色皿清洗', '避免刮伤光学面'),
(6, 1, 'en-US', 'Turn on and warm up for 20 minutes', 'Warm-up ensures light source stability'),
(6, 2, 'en-US', 'Set detection wavelength', 'Follow experiment requirements'),
(6, 3, 'en-US', 'Insert blank cuvette, zero the instrument', 'Use same solvent'),
(6, 4, 'en-US', 'Insert sample, read absorbance', 'Wipe cuvette outer surface'),
(6, 5, 'en-US', 'Record data, remove and clean cuvette', 'Avoid scratching optical surfaces');

-- 7. 离心机 (id=7)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(7, 1, 'zh-CN', '检查样品管是否平衡，使用天平配平', '确保样品管重量一致'),
(7, 2, 'zh-CN', '将样品管对称放置在转子中', '对角放置确保平衡'),
(7, 3, 'zh-CN', '盖紧离心机盖子', '盖子未盖紧无法启动'),
(7, 4, 'zh-CN', '设定转速和时间', '根据样品类型选择合适的参数'),
(7, 5, 'zh-CN', '启动离心机，等待完全停止后再开盖', '运行时切勿打开盖子'),
(7, 1, 'en-US', 'Check if sample tubes are balanced, use balance to counterweight', 'Ensure tubes have equal weight'),
(7, 2, 'en-US', 'Place sample tubes symmetrically in rotor', 'Place opposite each other to maintain balance'),
(7, 3, 'en-US', 'Close centrifuge lid tightly', 'Unit will not start if lid is not properly closed'),
(7, 4, 'en-US', 'Set speed and time', 'Select appropriate parameters based on sample type'),
(7, 5, 'en-US', 'Start centrifuge, wait for complete stop before opening', 'Never open lid during operation');

-- 8. 凝胶成像系统 (id=8)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(8, 1, 'zh-CN', '打开成像系统电源，启动软件', '等待系统初始化'),
(8, 2, 'zh-CN', '将凝胶放置在透射台上', '确保凝胶位置正确'),
(8, 3, 'zh-CN', '选择合适的光源（紫外/白光）', '紫外光需戴防护面罩'),
(8, 4, 'zh-CN', '调节曝光时间，预览图像', '避免过曝'),
(8, 5, 'zh-CN', '拍摄并保存图像', '保存原始数据'),
(8, 1, 'en-US', 'Turn on imaging system power, launch software', 'Wait for system initialization'),
(8, 2, 'en-US', 'Place gel on transilluminator', 'Ensure gel is positioned correctly'),
(8, 3, 'en-US', 'Select appropriate light source (UV/white)', 'Wear face shield for UV light'),
(8, 4, 'en-US', 'Adjust exposure time, preview image', 'Avoid overexposure'),
(8, 5, 'en-US', 'Capture and save image', 'Save raw data');

-- 9. 电泳仪 (id=9)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(9, 1, 'zh-CN', '配制凝胶，倒入制胶槽', '插入梳子形成加样孔'),
(9, 2, 'zh-CN', '待凝胶凝固后，拔掉梳子', '轻柔操作防止破坏孔道'),
(9, 3, 'zh-CN', '将凝胶放入电泳槽，加入缓冲液', '缓冲液覆盖凝胶表面'),
(9, 4, 'zh-CN', '加样至加样孔中', '记录加样顺序'),
(9, 5, 'zh-CN', '盖上盖子，连接电极，设定电压', '注意正负极方向'),
(9, 6, 'zh-CN', '电泳完成后，关闭电源，取出凝胶', '观察染料前沿位置'),
(9, 1, 'en-US', 'Prepare gel, pour into casting tray', 'Insert comb to form wells'),
(9, 2, 'en-US', 'After gel solidifies, remove comb', 'Be gentle to avoid damaging wells'),
(9, 3, 'en-US', 'Place gel into tank, add buffer', 'Buffer should cover gel surface'),
(9, 4, 'en-US', 'Load samples into wells', 'Record loading order'),
(9, 5, 'en-US', 'Close lid, connect electrodes, set voltage', 'Pay attention to polarity'),
(9, 6, 'en-US', 'After electrophoresis, turn off power, remove gel', 'Monitor dye front position');

-- 10. 恒温培养箱 (id=10)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(10, 1, 'zh-CN', '设定所需温度', '根据培养要求设定'),
(10, 2, 'zh-CN', '等待温度稳定', '通常需要30-60分钟'),
(10, 3, 'zh-CN', '将培养物放入培养箱', '避免堆积过密'),
(10, 4, 'zh-CN', '记录放入时间和温度', '定期检查'),
(10, 5, 'zh-CN', '培养结束后取出样品', '关闭箱门'),
(10, 1, 'en-US', 'Set desired temperature', 'Follow culture requirements'),
(10, 2, 'en-US', 'Wait for temperature to stabilize', 'Usually takes 30-60 minutes'),
(10, 3, 'en-US', 'Place cultures into incubator', 'Avoid overcrowding'),
(10, 4, 'en-US', 'Record time and temperature', 'Check periodically'),
(10, 5, 'en-US', 'Remove samples after incubation', 'Close the door');

-- 11. 冰箱 (id=11)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(11, 1, 'zh-CN', '检查冰箱温度是否正常', '4°C或-20°C根据要求'),
(11, 2, 'zh-CN', '将样品放入适当温度区域', '避免靠近门边'),
(11, 3, 'zh-CN', '关好冰箱门', '确保密封'),
(11, 4, 'zh-CN', '记录存放位置和日期', '便于后续查找'),
(11, 5, 'zh-CN', '定期除霜（如需）', '避免冰层过厚'),
(11, 1, 'en-US', 'Check if refrigerator temperature is normal', '4°C or -20°C as required'),
(11, 2, 'en-US', 'Place samples in appropriate temperature zone', 'Avoid near door'),
(11, 3, 'en-US', 'Close refrigerator door properly', 'Ensure seal is tight'),
(11, 4, 'en-US', 'Record location and date', 'For easy retrieval'),
(11, 5, 'en-US', 'Defrost regularly if needed', 'Avoid excessive ice buildup');

-- 12. 微波炉 (id=12)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(12, 1, 'zh-CN', '将溶液或琼脂倒入可微波容器', '使用专用微波容器'),
(12, 2, 'zh-CN', '盖上透气盖或保鲜膜（扎孔）', '不要完全密封'),
(12, 3, 'zh-CN', '设定时间，启动微波炉', '中高火加热'),
(12, 4, 'zh-CN', '取出容器，轻轻摇匀', '使用隔热手套防烫伤'),
(12, 5, 'zh-CN', '冷却至适当温度后使用', '避免过热'),
(12, 1, 'en-US', 'Pour solution or agar into microwave-safe container', 'Use microwave-safe container'),
(12, 2, 'en-US', 'Cover with vented lid or perforated wrap', 'Do not seal completely'),
(12, 3, 'en-US', 'Set time and start microwave', 'Use medium-high power'),
(12, 4, 'en-US', 'Remove container, gently swirl to mix', 'Use heat-resistant gloves to prevent burns'),
(12, 5, 'en-US', 'Cool to appropriate temperature before use', 'Avoid overheating');

-- 13. 酒精灯 (id=13)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(13, 1, 'zh-CN', '检查酒精量，不超过容积的2/3', '酒精不足及时添加'),
(13, 2, 'zh-CN', '检查灯芯是否完好', '灯芯应平整'),
(13, 3, 'zh-CN', '用火柴或打火机点燃', '不可用已点燃的酒精灯对火'),
(13, 4, 'zh-CN', '使用灯帽盖灭火焰', '不可用嘴吹灭'),
(13, 5, 'zh-CN', '冷却后方可移动', '避免烫伤'),
(13, 1, 'en-US', 'Check alcohol level, not exceeding 2/3 of volume', 'Refill if low'),
(13, 2, 'en-US', 'Check if wick is intact', 'Wick should be flat'),
(13, 3, 'en-US', 'Light with match or lighter', 'Do not use another lit burner'),
(13, 4, 'en-US', 'Extinguish with cap', 'Do not blow out'),
(13, 5, 'en-US', 'Wait to cool before moving', 'Avoid burns');

-- 14. 油镜 (id=14)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(14, 1, 'zh-CN', '先用低倍镜找到目标区域', '中心对准'),
(14, 2, 'zh-CN', '滴一滴香柏油于标本中央', '使用专用镜油'),
(14, 3, 'zh-CN', '旋转物镜转盘，使油镜浸入油中', '缓慢转动避免碰撞'),
(14, 4, 'zh-CN', '使用细准焦螺旋调焦至清晰', '微调即可'),
(14, 5, 'zh-CN', '观察完毕后，用擦镜纸清洁油镜', '纵向单方向擦拭'),
(14, 1, 'en-US', 'Locate target area with low power first', 'Center the specimen'),
(14, 2, 'en-US', 'Apply one drop of immersion oil on specimen', 'Use immersion oil only'),
(14, 3, 'en-US', 'Rotate objective turret, immerse oil lens into oil', 'Rotate slowly to avoid collision'),
(14, 4, 'en-US', 'Focus with fine focus knob until clear', 'Only fine adjustment needed'),
(14, 5, 'en-US', 'After observation, clean oil lens with lens paper', 'Wipe in one direction');

-- 15. CO₂麻醉箱 (id=15)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(15, 1, 'zh-CN', '检查设备连接和气源', '确保CO₂气源充足'),
(15, 2, 'zh-CN', '将动物放入麻醉箱', '避免过度拥挤'),
(15, 3, 'zh-CN', '通入CO₂气体', '按规范调节流速'),
(15, 4, 'zh-CN', '观察动物反应，确认麻醉状态', '无自主活动后等待5分钟'),
(15, 5, 'zh-CN', '关闭气源，取出动物', '确认死亡后处理'),
(15, 1, 'en-US', 'Check equipment connection and gas supply', 'Ensure CO₂ supply is sufficient'),
(15, 2, 'en-US', 'Place animal into anesthesia chamber', 'Avoid overcrowding'),
(15, 3, 'en-US', 'Flow CO₂ gas', 'Adjust flow rate according to protocol'),
(15, 4, 'en-US', 'Observe animal response, confirm anesthesia', 'Wait 5 minutes after no spontaneous movement'),
(15, 5, 'en-US', 'Turn off gas, remove animal', 'Confirm death before disposal');

-- 16. 恒温加热板 (id=16)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(16, 1, 'zh-CN', '将加热板置于平稳台面', '远离易燃物'),
(16, 2, 'zh-CN', '设定所需温度', '根据实验要求'),
(16, 3, 'zh-CN', '等待温度稳定', '通常需要10-15分钟'),
(16, 4, 'zh-CN', '将样品或容器放在加热板上', '使用隔热垫'),
(16, 5, 'zh-CN', '实验结束后关闭电源', '注意高温表面'),
(16, 1, 'en-US', 'Place heating plate on stable table', 'Keep away from flammable materials'),
(16, 2, 'en-US', 'Set desired temperature', 'Follow experiment requirements'),
(16, 3, 'en-US', 'Wait for temperature to stabilize', 'Usually takes 10-15 minutes'),
(16, 4, 'en-US', 'Place sample or container on heating plate', 'Use heat-insulating pad'),
(16, 5, 'en-US', 'Turn off power after experiment', 'Beware of hot surface');

-- 17. 二氧化碳窒息装置 (id=17)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(17, 1, 'zh-CN', '检查设备连接和气源', '确保CO₂气源充足'),
(17, 2, 'zh-CN', '将动物放入窒息箱', '避免过度拥挤'),
(17, 3, 'zh-CN', '通入CO₂气体', '按规范调节流速'),
(17, 4, 'zh-CN', '观察动物反应，确认死亡', '5分钟后确认'),
(17, 5, 'zh-CN', '关闭气源，取出动物', '按规定处理尸体'),
(17, 1, 'en-US', 'Check equipment connection and gas supply', 'Ensure CO₂ supply is sufficient'),
(17, 2, 'en-US', 'Place animal into asphyxiation chamber', 'Avoid overcrowding'),
(17, 3, 'en-US', 'Flow CO₂ gas', 'Adjust flow rate according to protocol'),
(17, 4, 'en-US', 'Observe animal response, confirm death', 'Confirm after 5 minutes'),
(17, 5, 'en-US', 'Turn off gas, remove animal', 'Dispose according to regulations');

-- 18. 一体式倒置荧光显微镜 (id=18)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(18, 1, 'zh-CN', '打开显微镜和光源，预热10-15分钟', '预热保证光源稳定'),
(18, 2, 'zh-CN', '将培养皿放置在载物台上', '确保培养皿底部清洁'),
(18, 3, 'zh-CN', '使用明场找到目标细胞', '从低倍镜开始'),
(18, 4, 'zh-CN', '切换至荧光模式，选择激发波长', '避免长时间照射导致荧光淬灭'),
(18, 5, 'zh-CN', '调节曝光时间，拍摄图像', '保存原始数据'),
(18, 6, 'zh-CN', '使用后关闭光源，清洁镜头', '避免残留物污染'),
(18, 1, 'en-US', 'Turn on microscope and light source, warm up for 10-15 min', 'Preheating ensures light source stability'),
(18, 2, 'en-US', 'Place culture dish on stage', 'Ensure dish bottom is clean'),
(18, 3, 'en-US', 'Find target cells using bright field', 'Start with low power'),
(18, 4, 'en-US', 'Switch to fluorescence mode, select excitation wavelength', 'Avoid prolonged exposure to prevent photobleaching'),
(18, 5, 'en-US', 'Adjust exposure time, capture image', 'Save raw data'),
(18, 6, 'en-US', 'Turn off light source after use, clean objective', 'Avoid residue contamination');

-- 19. 多功能酶标仪 (id=19)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(19, 1, 'zh-CN', '开机预热20分钟', '确保光源稳定'),
(19, 2, 'zh-CN', '打开软件，选择检测模式', '根据实验选择'),
(19, 3, 'zh-CN', '设置检测波长和增益', '根据试剂盒说明'),
(19, 4, 'zh-CN', '将微孔板放入仪器', '确保孔板方向正确'),
(19, 5, 'zh-CN', '运行检测，保存数据', '避免移动孔板'),
(19, 1, 'en-US', 'Turn on and warm up for 20 minutes', 'Ensure light source stability'),
(19, 2, 'en-US', 'Open software, select detection mode', 'Choose based on experiment'),
(19, 3, 'en-US', 'Set detection wavelength and gain', 'Follow kit instructions'),
(19, 4, 'en-US', 'Place microplate into instrument', 'Ensure correct orientation'),
(19, 5, 'en-US', 'Run assay, save data', 'Avoid moving plate during reading');

-- 20. 酶标仪 (id=20)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(20, 1, 'zh-CN', '开机预热15分钟', '等待光源稳定'),
(20, 2, 'zh-CN', '设定检测波长', '根据实验要求'),
(20, 3, 'zh-CN', '放入空白孔板调零', '使用相同缓冲液'),
(20, 4, 'zh-CN', '放入样品孔板，读取吸光度', '记录数值'),
(20, 5, 'zh-CN', '取出孔板，关闭仪器', '清洁仪器'),
(20, 1, 'en-US', 'Turn on and warm up for 15 minutes', 'Wait for light source to stabilize'),
(20, 2, 'en-US', 'Set detection wavelength', 'Follow experiment requirements'),
(20, 3, 'en-US', 'Insert blank plate to zero', 'Use same buffer'),
(20, 4, 'en-US', 'Insert sample plate, read absorbance', 'Record values'),
(20, 5, 'en-US', 'Remove plate, turn off instrument', 'Clean the instrument');

-- 21. 凝胶成像系统 (id=21)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(21, 1, 'zh-CN', '打开成像系统电源，启动软件', '等待系统初始化'),
(21, 2, 'zh-CN', '将凝胶放置在透射台上', '确保无气泡'),
(21, 3, 'zh-CN', '选择化学发光或荧光模式', '根据实验选择'),
(21, 4, 'zh-CN', '调节曝光时间，预览图像', '避免过曝'),
(21, 5, 'zh-CN', '拍摄并保存图像', '保存原始数据'),
(21, 6, 'zh-CN', '清洁透射台', '使用无尘纸'),
(21, 1, 'en-US', 'Turn on imaging system power, launch software', 'Wait for system initialization'),
(21, 2, 'en-US', 'Place gel on transilluminator', 'Ensure no bubbles'),
(21, 3, 'en-US', 'Select chemiluminescence or fluorescence mode', 'Choose based on experiment'),
(21, 4, 'en-US', 'Adjust exposure time, preview image', 'Avoid overexposure'),
(21, 5, 'en-US', 'Capture and save image', 'Save raw data'),
(21, 6, 'en-US', 'Clean transilluminator', 'Use lint-free wipes');

-- 22. 倒置荧光显微镜 (id=22)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(22, 1, 'zh-CN', '打开显微镜和光源，预热10-15分钟', '预热保证光源稳定性'),
(22, 2, 'zh-CN', '将培养皿放置在载物台上', '确保培养皿底部清洁'),
(22, 3, 'zh-CN', '选择合适物镜，调节焦距', '从低倍镜开始'),
(22, 4, 'zh-CN', '切换至荧光模式，选择合适激发波长', '避免长时间照射导致荧光淬灭'),
(22, 5, 'zh-CN', '调节曝光时间和增益，拍摄图像', '保存原始数据'),
(22, 1, 'en-US', 'Turn on microscope and light source, warm up for 10-15 min', 'Preheating ensures light source stability'),
(22, 2, 'en-US', 'Place culture dish on stage', 'Ensure dish bottom is clean'),
(22, 3, 'en-US', 'Select appropriate objective and focus', 'Start with low power'),
(22, 4, 'en-US', 'Switch to fluorescence mode, select excitation wavelength', 'Avoid prolonged exposure to prevent photobleaching'),
(22, 5, 'en-US', 'Adjust exposure time and gain, capture image', 'Save raw data');

-- 23. 实时荧光定量PCR仪 (id=23)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(23, 1, 'zh-CN', '配制PCR反应体系，加入96孔板', '在洁净区操作，避免污染'),
(23, 2, 'zh-CN', '封好光学膜，确保密封', '避免气泡影响信号'),
(23, 3, 'zh-CN', '将孔板放入仪器，关闭盖子', '确保放置平整'),
(23, 4, 'zh-CN', '设置反应程序和检测通道', '根据试剂盒说明设置'),
(23, 5, 'zh-CN', '运行程序，分析扩增曲线和CT值', '检查熔解曲线确认特异性'),
(23, 1, 'en-US', 'Prepare PCR reaction mix, add to 96-well plate', 'Operate in clean area, avoid contamination'),
(23, 2, 'en-US', 'Seal with optical film, ensure tight seal', 'Avoid bubbles that may affect signal'),
(23, 3, 'en-US', 'Place plate into instrument and close lid', 'Ensure plate is flat'),
(23, 4, 'en-US', 'Set reaction program and detection channels', 'Follow kit instructions for settings'),
(23, 5, 'en-US', 'Run program, analyze amplification curve and Ct values', 'Check melt curve to confirm specificity');

-- 24. 荧光定量PCR系统 (id=24)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(24, 1, 'zh-CN', '配制PCR反应体系', '使用无核酸酶试剂'),
(24, 2, 'zh-CN', '加入384孔板，封膜', '避免气泡'),
(24, 3, 'zh-CN', '将孔板放入仪器', '确保方向正确'),
(24, 4, 'zh-CN', '设置反应程序和检测通道', '设置多重荧光检测'),
(24, 5, 'zh-CN', '运行程序，分析数据', '检查扩增曲线'),
(24, 1, 'en-US', 'Prepare PCR reaction mix', 'Use nuclease-free reagents'),
(24, 2, 'en-US', 'Add to 384-well plate, seal', 'Avoid bubbles'),
(24, 3, 'en-US', 'Place plate into instrument', 'Ensure correct orientation'),
(24, 4, 'en-US', 'Set reaction program and detection channels', 'Set multiplex detection'),
(24, 5, 'en-US', 'Run program, analyze data', 'Check amplification curves');

-- 25. 超高速冷冻离心机 (id=25)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(25, 1, 'zh-CN', '预冷转子至设定温度', '提前设置温度'),
(25, 2, 'zh-CN', '样品管严格配平', '重量差小于0.1g'),
(25, 3, 'zh-CN', '对称放置样品管', '使用专用转子'),
(25, 4, 'zh-CN', '盖紧转子盖子', '确保锁紧'),
(25, 5, 'zh-CN', '设定转速和时间，启动', '不可超过转子最大转速'),
(25, 6, 'zh-CN', '完全停止后开盖，取出样品', '检查样品管'),
(25, 1, 'en-US', 'Pre-cool rotor to set temperature', 'Set temperature in advance'),
(25, 2, 'en-US', 'Balance sample tubes precisely', 'Weight difference <0.1g'),
(25, 3, 'en-US', 'Place sample tubes symmetrically', 'Use proper rotor'),
(25, 4, 'en-US', 'Tighten rotor lid', 'Ensure it is locked'),
(25, 5, 'en-US', 'Set speed and time, start', 'Do not exceed rotor maximum speed'),
(25, 6, 'en-US', 'Open lid after complete stop, remove samples', 'Check sample tubes');

-- 26. 双色红外激光成像系统 (id=26)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(26, 1, 'zh-CN', '打开仪器和软件', '等待初始化'),
(26, 2, 'zh-CN', '将膜放置在扫描台上', '确保膜平整无气泡'),
(26, 3, 'zh-CN', '设置扫描参数（通道、分辨率）', '根据实验选择'),
(26, 4, 'zh-CN', '运行扫描', '避免移动'),
(26, 5, 'zh-CN', '保存图像，进行定量分析', '避免信号饱和'),
(26, 1, 'en-US', 'Turn on instrument and software', 'Wait for initialization'),
(26, 2, 'en-US', 'Place membrane on scanning stage', 'Ensure membrane is flat without bubbles'),
(26, 3, 'en-US', 'Set scanning parameters (channels, resolution)', 'Choose based on experiment'),
(26, 4, 'en-US', 'Run scan', 'Avoid moving during scan'),
(26, 5, 'en-US', 'Save image, perform quantitative analysis', 'Avoid signal saturation');

-- 27. 激光共聚焦显微镜 (id=27)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(27, 1, 'zh-CN', '打开显微镜和激光器', '预热10-15分钟'),
(27, 2, 'zh-CN', '放置样品，调焦', '使用低倍镜定位'),
(27, 3, 'zh-CN', '选择激光和检测通道', '根据荧光染料选择'),
(27, 4, 'zh-CN', '设置扫描参数（分辨率、扫描速度）', '根据样品调整'),
(27, 5, 'zh-CN', '采集Z-stack或时间序列', '设置层间距'),
(27, 6, 'zh-CN', '保存图像，关闭激光器', '避免激光长时间照射'),
(27, 1, 'en-US', 'Turn on microscope and lasers', 'Warm up for 10-15 minutes'),
(27, 2, 'en-US', 'Place sample, focus', 'Locate with low power objective'),
(27, 3, 'en-US', 'Select laser and detection channels', 'Choose based on fluorescent dyes'),
(27, 4, 'en-US', 'Set scanning parameters (resolution, speed)', 'Adjust based on sample'),
(27, 5, 'en-US', 'Acquire Z-stack or time series', 'Set step size'),
(27, 6, 'en-US', 'Save images, turn off lasers', 'Avoid prolonged laser exposure');

-- 28. 原子吸收光谱仪 (id=28)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(28, 1, 'zh-CN', '安装空心阴极灯，预热30分钟', '灯电流按说明设置'),
(28, 2, 'zh-CN', '调节光路，优化信号', '确保最大透过率'),
(28, 3, 'zh-CN', '配制标准溶液，建立标准曲线', '至少5个浓度点'),
(28, 4, 'zh-CN', '将样品雾化，测量吸光度', '每次测量后清洗'),
(28, 5, 'zh-CN', '根据标准曲线计算浓度', 'R²应大于0.995'),
(28, 1, 'en-US', 'Install hollow cathode lamp, warm up for 30 min', 'Set lamp current as per instructions'),
(28, 2, 'en-US', 'Adjust light path, optimize signal', 'Ensure maximum transmission'),
(28, 3, 'en-US', 'Prepare standard solutions, create calibration curve', 'At least 5 concentration points'),
(28, 4, 'en-US', 'Atomize sample, measure absorbance', 'Clean after each measurement'),
(28, 5, 'en-US', 'Calculate concentration from calibration curve', 'R² should be >0.995');

-- 29. 高效液相色谱仪 (id=29)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(29, 1, 'zh-CN', '过滤并脱气流动相', '使用0.45μm滤膜'),
(29, 2, 'zh-CN', '启动泵，排除系统气泡', '注意观察压力'),
(29, 3, 'zh-CN', '平衡色谱柱至压力稳定', '通常需要20-30分钟'),
(29, 4, 'zh-CN', '进样分析', '记录保留时间'),
(29, 5, 'zh-CN', '运行结束后冲洗色谱柱', '防止盐析'),
(29, 6, 'zh-CN', '关闭仪器，记录日志', '填写使用记录'),
(29, 1, 'en-US', 'Filter and degas mobile phase', 'Use 0.45μm filter'),
(29, 2, 'en-US', 'Start pump, purge air bubbles from system', 'Monitor pressure'),
(29, 3, 'en-US', 'Equilibrate column until pressure stable', 'Usually takes 20-30 minutes'),
(29, 4, 'en-US', 'Inject sample for analysis', 'Record retention time'),
(29, 5, 'en-US', 'Flush column after run', 'Prevent salt precipitation'),
(29, 6, 'en-US', 'Turn off instrument, log usage', 'Fill in usage log');

-- 30. 纳米粒度分析仪 (id=30)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(30, 1, 'zh-CN', '打开仪器，预热30分钟', '等待温度稳定'),
(30, 2, 'zh-CN', '样品过滤除尘', '使用0.22μm滤膜'),
(30, 3, 'zh-CN', '将样品加入比色皿', '无气泡'),
(30, 4, 'zh-CN', '放入仪器，开始测量', '选择合适参数'),
(30, 5, 'zh-CN', '记录粒径和PDI值', '重复测量3次'),
(30, 1, 'en-US', 'Turn on instrument, warm up for 30 minutes', 'Wait for temperature stabilization'),
(30, 2, 'en-US', 'Filter sample to remove dust', 'Use 0.22μm filter'),
(30, 3, 'en-US', 'Add sample to cuvette', 'No bubbles'),
(30, 4, 'en-US', 'Place in instrument, start measurement', 'Select appropriate parameters'),
(30, 5, 'en-US', 'Record size and PDI', 'Measure 3 times for consistency');

-- 31. 同步热分析-红外光谱联用仪 (id=31)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(31, 1, 'zh-CN', '打开FTIR和TGA，预热30分钟', '等待红外稳定'),
(31, 2, 'zh-CN', '检查气体流速', '确保吹扫气充足'),
(31, 3, 'zh-CN', '将样品放入坩埚，归零', '记录样品质量'),
(31, 4, 'zh-CN', '设置升温程序', '根据样品特性设置'),
(31, 5, 'zh-CN', '启动测量，实时监测', '观察红外图谱变化'),
(31, 6, 'zh-CN', '分析数据，清洁仪器', '使用后清洁'),
(31, 1, 'en-US', 'Turn on FTIR and TGA, warm up for 30 min', 'Wait for IR stabilization'),
(31, 2, 'en-US', 'Check gas flow rate', 'Ensure purge gas is sufficient'),
(31, 3, 'en-US', 'Place sample in crucible, tare', 'Record sample mass'),
(31, 4, 'en-US', 'Set temperature program', 'Choose based on sample properties'),
(31, 5, 'en-US', 'Start measurement, monitor in real-time', 'Observe IR spectral changes'),
(31, 6, 'en-US', 'Analyze data, clean instrument', 'Clean after use');

-- 32. 超高效液相色谱仪 (id=32)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(32, 1, 'zh-CN', '过滤并脱气流动相', '使用UPLC专用溶剂'),
(32, 2, 'zh-CN', '安装UPLC专用色谱柱', '注意压力上限'),
(32, 3, 'zh-CN', '平衡色谱柱', '观察压力稳定'),
(32, 4, 'zh-CN', '进样分析', '使用小体积进样'),
(32, 5, 'zh-CN', '运行结束后冲洗色谱柱', '避免残留'),
(32, 6, 'zh-CN', '关闭仪器', '填写使用记录'),
(32, 1, 'en-US', 'Filter and degas mobile phase', 'Use UPLC-grade solvents'),
(32, 2, 'en-US', 'Install UPLC-specific column', 'Note maximum pressure limit'),
(32, 3, 'en-US', 'Equilibrate column', 'Monitor pressure stability'),
(32, 4, 'en-US', 'Inject sample for analysis', 'Use small injection volume'),
(32, 5, 'en-US', 'Flush column after run', 'Prevent carryover'),
(32, 6, 'en-US', 'Turn off instrument', 'Fill in usage log');

-- 33. 气相色谱仪 (id=33)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(33, 1, 'zh-CN', '检查载气压力和纯度', '确保无泄漏'),
(33, 2, 'zh-CN', '设置进样口、柱箱、检测器温度', '程序升温设置'),
(33, 3, 'zh-CN', '等待温度稳定', '通常需要30分钟'),
(33, 4, 'zh-CN', '进样分析', '快速准确'),
(33, 5, 'zh-CN', '数据分析，计算保留时间', '使用内标或外标法'),
(33, 6, 'zh-CN', '降温后关机', '保护色谱柱'),
(33, 1, 'en-US', 'Check carrier gas pressure and purity', 'Ensure no leaks'),
(33, 2, 'en-US', 'Set inlet, oven, detector temperatures', 'Set temperature program'),
(33, 3, 'en-US', 'Wait for temperature to stabilize', 'Usually takes 30 minutes'),
(33, 4, 'en-US', 'Inject sample for analysis', 'Quick and accurate injection'),
(33, 5, 'en-US', 'Analyze data, calculate retention time', 'Use internal or external standard'),
(33, 6, 'en-US', 'Cool down before shutdown', 'Protect column');

-- 34. 流式细胞仪 (id=34)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(34, 1, 'zh-CN', '打开仪器电源，预热15分钟', '检查鞘液桶液位'),
(34, 2, 'zh-CN', '清洗管路，运行质控微球', '验证仪器性能'),
(34, 3, 'zh-CN', '设置检测参数（电压、补偿）', '根据荧光染料设置'),
(34, 4, 'zh-CN', '将样品过滤为单细胞悬液', '使用细胞滤网'),
(34, 5, 'zh-CN', '上样，采集数据', '记录事件数'),
(34, 6, 'zh-CN', '清洗管路，关闭仪器', '防止堵塞'),
(34, 1, 'en-US', 'Turn on instrument, warm up for 15 min', 'Check sheath fluid level'),
(34, 2, 'en-US', 'Clean fluidics, run quality control beads', 'Verify instrument performance'),
(34, 3, 'en-US', 'Set detection parameters (voltage, compensation)', 'Adjust based on fluorescent dyes'),
(34, 4, 'en-US', 'Filter sample to single-cell suspension', 'Use cell strainer'),
(34, 5, 'en-US', 'Load sample, acquire data', 'Record event count'),
(34, 6, 'en-US', 'Clean fluidics, turn off instrument', 'Prevent clogging');

-- 35. 计算机集群 (id=35)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(35, 1, 'zh-CN', '登录集群登录节点', '使用SSH或远程桌面'),
(35, 2, 'zh-CN', '加载所需软件模块', 'module load命令'),
(35, 3, 'zh-CN', '准备输入文件和作业脚本', '指定计算资源'),
(35, 4, 'zh-CN', '提交作业到计算节点', '使用sbatch或qsub'),
(35, 5, 'zh-CN', '监控作业运行状态', '使用squeue或qstat'),
(35, 6, 'zh-CN', '作业完成后下载结果', '及时清理临时文件'),
(35, 1, 'en-US', 'Login to cluster login node', 'Use SSH or remote desktop'),
(35, 2, 'en-US', 'Load required software modules', 'Use module load command'),
(35, 3, 'en-US', 'Prepare input files and job script', 'Specify computing resources'),
(35, 4, 'en-US', 'Submit job to compute nodes', 'Use sbatch or qsub'),
(35, 5, 'en-US', 'Monitor job status', 'Use squeue or qstat'),
(35, 6, 'en-US', 'Download results after job completion', 'Clean up temporary files');

-- 36. 超高效液相色谱-质谱联用仪 (id=36)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(36, 1, 'zh-CN', '打开UPLC和MS电源', '启动工作站'),
(36, 2, 'zh-CN', '检查真空度和氮气压力', '真空度需达标'),
(36, 3, 'zh-CN', '校准质量轴', '使用标准液校准'),
(36, 4, 'zh-CN', '设置色谱和质谱方法', '根据分析物选择'),
(36, 5, 'zh-CN', '进样分析', '使用高纯度溶剂'),
(36, 6, 'zh-CN', '运行结束后冲洗色谱柱和离子源', '避免盐分残留'),
(36, 1, 'en-US', 'Turn on UPLC and MS power', 'Start workstation'),
(36, 2, 'en-US', 'Check vacuum level and nitrogen pressure', 'Vacuum must reach required level'),
(36, 3, 'en-US', 'Calibrate mass axis', 'Use calibration standard'),
(36, 4, 'en-US', 'Set LC and MS methods', 'Choose based on analyte'),
(36, 5, 'en-US', 'Inject sample for analysis', 'Use high-purity solvents'),
(36, 6, 'en-US', 'Flush column and ion source after run', 'Prevent salt buildup');

-- 37. 蛋白纯化系统 (id=37)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(37, 1, 'zh-CN', '检查缓冲液和管路', '确保无气泡'),
(37, 2, 'zh-CN', '安装层析柱，连接检测器', '记录柱信息'),
(37, 3, 'zh-CN', '用起始缓冲液平衡柱子', '观察基线稳定'),
(37, 4, 'zh-CN', '样品过滤后上样', '使用0.45μm滤膜'),
(37, 5, 'zh-CN', '梯度洗脱，收集馏分', '设定收集体积'),
(37, 6, 'zh-CN', '分析洗脱峰，清洗层析柱', '保存色谱图'),
(37, 1, 'en-US', 'Check buffer and tubing', 'Ensure no bubbles'),
(37, 2, 'en-US', 'Install column, connect detector', 'Record column info'),
(37, 3, 'en-US', 'Equilibrate column with starting buffer', 'Monitor baseline stability'),
(37, 4, 'en-US', 'Filter sample before loading', 'Use 0.45μm filter'),
(37, 5, 'en-US', 'Gradient elution, collect fractions', 'Set collection volume'),
(37, 6, 'en-US', 'Analyze elution peaks, clean column', 'Save chromatogram');

-- 38. 紫外可见光近红外光谱仪 (id=38)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(38, 1, 'zh-CN', '开机预热30分钟', '等待光源稳定'),
(38, 2, 'zh-CN', '进行空白背景扫描', '使用空比色皿'),
(38, 3, 'zh-CN', '将样品放入光路', '擦拭比色皿外壁'),
(38, 4, 'zh-CN', '扫描样品光谱', '设定波长范围'),
(38, 5, 'zh-CN', '记录吸光度或透过率', '保存光谱数据'),
(38, 1, 'en-US', 'Turn on and warm up for 30 minutes', 'Wait for light source to stabilize'),
(38, 2, 'en-US', 'Run blank background scan', 'Use empty cuvette'),
(38, 3, 'en-US', 'Place sample in light path', 'Wipe cuvette outer surface'),
(38, 4, 'en-US', 'Scan sample spectrum', 'Set wavelength range'),
(38, 5, 'en-US', 'Record absorbance or transmittance', 'Save spectral data');

-- 39. 高通量荧光定量PCR (id=39)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(39, 1, 'zh-CN', '配制PCR预混液', '使用自动化加样系统'),
(39, 2, 'zh-CN', '分装至384孔板', '避免交叉污染'),
(39, 3, 'zh-CN', '封膜，离心', '去除气泡'),
(39, 4, 'zh-CN', '放入仪器，设置程序', '选择高通量模式'),
(39, 5, 'zh-CN', '运行PCR，分析数据', '检查熔解曲线'),
(39, 1, 'en-US', 'Prepare PCR master mix', 'Use automated dispensing system'),
(39, 2, 'en-US', 'Dispense to 384-well plate', 'Avoid cross-contamination'),
(39, 3, 'en-US', 'Seal plate, centrifuge', 'Remove bubbles'),
(39, 4, 'en-US', 'Place in instrument, set program', 'Select high-throughput mode'),
(39, 5, 'en-US', 'Run PCR, analyze data', 'Check melt curves');

-- 40. 台式核磁共振波谱仪 (id=40)
INSERT IGNORE INTO operation_steps (equipment_id, step_order, language_code, description, tip) VALUES
(40, 1, 'zh-CN', '开机，等待磁场稳定', '通常需要10-15分钟'),
(40, 2, 'zh-CN', '样品溶解后加入核磁管', '确保样品澄清'),
(40, 3, 'zh-CN', '将核磁管放入样品腔', '垂直放入'),
(40, 4, 'zh-CN', '设置扫描参数（溶剂、脉冲序列）', '氘代溶剂锁场'),
(40, 5, 'zh-CN', '开始采集，进行傅里叶变换', '累加适当次数'),
(40, 6, 'zh-CN', '分析谱图，输出结果', '基线校正和积分'),
(40, 1, 'en-US', 'Turn on, wait for magnetic field to stabilize', 'Usually takes 10-15 minutes'),
(40, 2, 'en-US', 'Dissolve sample, add to NMR tube', 'Ensure sample is clear'),
(40, 3, 'en-US', 'Insert NMR tube into sample chamber', 'Insert vertically'),
(40, 4, 'en-US', 'Set acquisition parameters (solvent, pulse sequence)', 'Lock using deuterated solvent'),
(40, 5, 'en-US', 'Start acquisition, perform Fourier transform', 'Accumulate appropriate scans'),
(40, 6, 'en-US', 'Analyze spectrum, output results', 'Baseline correction and integration');

-- ============================================
-- 验证完成
-- ============================================
SELECT '✅ 器材总数' AS 统计, COUNT(*) AS 数量 FROM equipment
UNION ALL
SELECT '✅ 中文器材条目', COUNT(*) FROM equipment_translations WHERE language_code = 'zh-CN'
UNION ALL
SELECT '✅ 英文器材条目', COUNT(*) FROM equipment_translations WHERE language_code = 'en-US'
UNION ALL
SELECT '✅ 操作步骤总数', COUNT(*) FROM operation_steps;
