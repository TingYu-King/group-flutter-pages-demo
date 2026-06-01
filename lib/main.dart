import 'package:flutter/material.dart';

void main() {
  runApp(const GroupFlutterPagesApp());
}

class GroupFlutterPagesApp extends StatelessWidget {
  const GroupFlutterPagesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '小组 Flutter Web 展示页',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const TeamHomePage(),
    );
  }
}

class TeamHomePage extends StatelessWidget {
  const TeamHomePage({super.key});

  static const String projectTitle = '第 7 组校园活动展示平台';
static const String projectSlogan = '用 Flutter Web 展示我们的创意与协作';

  static const List<TeamMember> members = [
    TeamMember(role: '组长', name:   '胡玮明', task: '创建仓库、维护 main 分支、审核 PR、发布 GitHub Pages'),
    TeamMember(role: '组员 A', name: '张景涛', task: '修改首页标题和项目口号'),
    TeamMember(role: '组员 B', name: '李天宇', task: '补充成员介绍卡片'),
    TeamMember(role: '组员 C', name: '宋阳', task: '补充项目功能列表'),
    TeamMember(role: '组员 D', name: '张春瑾', task: '补充发布说明和访问地址'),
    TeamMember(role: '组员 E', name: '徐冲', task: 'UI 优化'),
    TeamMember(role: '组员 F', name: '杨航', task: '仓库 README 文档编写与维护'),
  ];

  static const List<String> features = [
    '展示小组项目主题和核心亮点',
    '展示成员姓名、角色和任务分工',
    '记录每位组员通过 Pull Request 完成的修改',
    '使用 GitHub Pages 发布 Flutter Web 静态页面',
  ];

  static const List<String> releaseNotes = [
    '源码维护分支：main 分支用于存放项目源代码，所有开发工作基于此分支进行。',
    '构建产物分支：Flutter Web 编译产物发布到 gh-pages 分支，由组长统一管理。',
    '部署执行主体：组长负责合并 PR 后执行部署命令，确保发布流程规范。',
    'GitHub Pages 访问地址：https://primer496.github.io/group-flutter-pages-demo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('小组项目展示')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HeroSection(),
          SizedBox(height: 20),
          MembersSection(),
          SizedBox(height: 20),
          FeaturesSection(),
          SizedBox(height: 20),
          ReleaseSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              TeamHomePage.projectTitle,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(TeamHomePage.projectSlogan, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class MembersSection extends StatelessWidget {
  const MembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('小组成员与分工', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...TeamHomePage.members.map((member) => MemberCard(member: member)),
      ],
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({required this.member, super.key});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(member.role.characters.last)),
        title: Text('${member.role}：${member.name}'),
        subtitle: Text(member.task),
      ),
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('项目功能', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamHomePage.features.map((feature) => Text('• $feature')),
          ],
        ),
      ),
    );
  }
}

class ReleaseSection extends StatelessWidget {
  const ReleaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('发布说明', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamHomePage.releaseNotes.map((note) => Text('• $note')),
          ],
        ),
      ),
    );
  }
}

class TeamMember {
  const TeamMember({required this.role, required this.name, required this.task});

  final String role;
  final String name;
  final String task;
}
