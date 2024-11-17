import 'package:flutter/material.dart';
import 'package:kazumi/modules/comments/comment_item.dart';
import 'package:kazumi/utils/utils.dart';

class EpisodeCommentsCard extends StatelessWidget {
  const EpisodeCommentsCard({
    super.key,
    required this.commentItem,
  });

  final EpisodeCommentItem commentItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(commentItem.comment.user.avatar.large),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(commentItem.comment.user.nickname),
                  Text(Utils.dateFormat(commentItem.comment.createdAt)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(commentItem.comment.comment),
          (commentItem.replies.isNotEmpty)
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: commentItem.replies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 48),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: Theme.of(context).dividerColor.withAlpha(60)),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(commentItem
                                      .replies[index].user.avatar.large),
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(commentItem
                                        .replies[index].user.nickname),
                                    Text(Utils.dateFormat(
                                        commentItem.replies[index].createdAt)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(commentItem.replies[index].comment),
                          ]),
                    );
                  })
              : Container()
        ]),
      ),
    );
  }
}
