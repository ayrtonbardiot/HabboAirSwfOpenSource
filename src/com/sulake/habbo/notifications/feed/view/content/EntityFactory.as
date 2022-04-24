// by nota

//com.sulake.habbo.notifications.feed.view.content.EntityFactory

package com.sulake.habbo.notifications.feed.view.content
{
    import com.sulake.habbo.notifications.feed.data.GenericNotificationItemData;
    import flash.utils.getTimer;

    public class EntityFactory 
    {


        public function dispose():void
        {
        }

        public function createNotificationEntity(_arg_1:GenericNotificationItemData):_SafeStr_3342
        {
            if ((_arg_1 is GenericNotificationItemData))
            {
                return (createGenericFeedEntity(_arg_1));
            };
            return (null);
        }

        private function createGenericFeedEntity(_arg_1:GenericNotificationItemData):_SafeStr_3342
        {
            var _local_2:FeedEntity = FeedEntity.allocate();
            _local_2.icon = _arg_1.iconImage;
            _local_2.title = _arg_1.title;
            _local_2.minutesElapsed = (((_arg_1.timeStamp - getTimer()) / 1000) / 60);
            _local_2.message = _arg_1.description;
            _local_2.decoration = _arg_1.decorationImage;
            _local_2.setButton(_arg_1.buttonAction, _arg_1.buttonCaption);
            _local_2.updateContainerSize();
            return (_local_2);
        }


    }
}//package com.sulake.habbo.notifications.feed.view.content

// _SafeStr_3342 = "_-qu" (String#6832, DoABC#4)


