// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.notifications.feed.NotificationController

package com.sulake.habbo.notifications.feed
{
    import com.sulake.habbo.notifications.HabboNotifications;
    import com.sulake.habbo.notifications.feed.view.content.EntityFactory;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.notifications.feed.view.content._SafeStr_3342;
    import com.sulake.habbo.notifications.feed.data.GenericNotificationItemData;
    import com.sulake.habbo.utils.HabboWebTools;

    public class NotificationController 
    {

        private var _SafeStr_4147:HabboNotifications;
        private var _SafeStr_4806:NotificationView;
        private var _SafeStr_4807:FeedSettings;
        private var _SafeStr_4808:EntityFactory;

        public function NotificationController(_arg_1:HabboNotifications)
        {
            _SafeStr_4147 = _arg_1;
            _SafeStr_4807 = new FeedSettings(this);
            _SafeStr_4806 = new NotificationView(this, _arg_1);
            _SafeStr_4808 = new EntityFactory();
            _SafeStr_4147.roomSessionManager.events.addEventListener("RSE_CREATED", roomSessionStateEventHandler);
            _SafeStr_4147.roomSessionManager.events.addEventListener("RSE_STARTED", roomSessionStateEventHandler);
            _SafeStr_4147.roomSessionManager.events.addEventListener("RSE_ENDED", roomSessionStateEventHandler);
        }

        public function dispose():void
        {
            if (_SafeStr_4806)
            {
                _SafeStr_4806.dispose();
                _SafeStr_4806 = null;
            };
            _SafeStr_4147.roomSessionManager.events.removeEventListener("RSE_CREATED", roomSessionStateEventHandler);
            _SafeStr_4147.roomSessionManager.events.removeEventListener("RSE_STARTED", roomSessionStateEventHandler);
            _SafeStr_4147.roomSessionManager.events.removeEventListener("RSE_ENDED", roomSessionStateEventHandler);
            _SafeStr_4147 = null;
            if (_SafeStr_4807)
            {
                _SafeStr_4807.dispose();
                _SafeStr_4807 = null;
            };
            if (_SafeStr_4808)
            {
                _SafeStr_4808.dispose();
                _SafeStr_4808 = null;
            };
        }

        private function roomSessionStateEventHandler(_arg_1:RoomSessionEvent):void
        {
            switch (_arg_1.type)
            {
                case "RSE_CREATED":
                case "RSE_STARTED":
                case "RSE_ENDED":
                    if (_SafeStr_4806)
                    {
                        _SafeStr_4806.setGameMode(_arg_1.session.isGameSession);
                    };
                    return;
            };
        }

        public function setFeedEnabled(_arg_1:Boolean):void
        {
            if (_SafeStr_4806)
            {
                _SafeStr_4806.setViewEnabled(_arg_1);
            };
        }

        public function getSettings():FeedSettings
        {
            return (_SafeStr_4807);
        }

        public function updateFeedCategoryFiltering():void
        {
        }

        public function addFeedItem(_arg_1:int, _arg_2:GenericNotificationItemData):void
        {
            var _local_3:_SafeStr_3342 = _SafeStr_4808.createNotificationEntity(_arg_2);
            _SafeStr_4806.addNotificationFeedItem(_arg_1, _local_3);
        }

        public function executeAction(_arg_1:String):void
        {
            if (_arg_1.indexOf("http") == 0)
            {
                HabboWebTools.openWebPage(_arg_1);
            };
        }


    }
}//package com.sulake.habbo.notifications.feed

// _SafeStr_3342 = "_-qu" (String#6832, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_4806 = "_-m13" (String#6470, DoABC#4)
// _SafeStr_4807 = "_-5k" (String#9217, DoABC#4)
// _SafeStr_4808 = "_-U1k" (String#9558, DoABC#4)


