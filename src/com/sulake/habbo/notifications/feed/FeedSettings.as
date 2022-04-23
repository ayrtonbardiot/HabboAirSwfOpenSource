// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.notifications.feed.FeedSettings

package com.sulake.habbo.notifications.feed
{
    import __AS3__.vec.Vector;

    public class FeedSettings 
    {

        public static const _SafeStr_8681:int = 0;
        public static const _SafeStr_8682:int = 1;
        public static const _SafeStr_8683:int = 2;
        public static const _SafeStr_8684:int = 3;
        public static const FEED_CATEGORY_ME:int = 0;
        public static const _SafeStr_8685:int = 1;
        public static const FEED_CATEGORY_HOTEL:int = 2;

        private var _SafeStr_6419:NotificationController;
        private var _SafeStr_6418:Vector.<int>;

        public function FeedSettings(_arg_1:NotificationController)
        {
            _SafeStr_6418 = new Vector.<int>();
            _SafeStr_6418.push(1);
            _SafeStr_6418.push(0);
            _SafeStr_6418.push(2);
        }

        public function dispose():void
        {
            _SafeStr_6419 = null;
            _SafeStr_6418 = null;
        }

        public function getVisibleFeedCategories():Vector.<int>
        {
            return (_SafeStr_6418);
        }

        public function toggleVisibleFeedCategory(_arg_1:int):void
        {
            _SafeStr_6419.updateFeedCategoryFiltering();
        }


    }
}//package com.sulake.habbo.notifications.feed

// _SafeStr_6418 = "_-vd" (String#8561, DoABC#4)
// _SafeStr_6419 = "_-4B" (String#22308, DoABC#4)
// _SafeStr_8681 = "_-hp" (String#32303, DoABC#4)
// _SafeStr_8682 = "_-W1n" (String#36613, DoABC#4)
// _SafeStr_8683 = "_-31r" (String#32635, DoABC#4)
// _SafeStr_8684 = "_-Cc" (String#39689, DoABC#4)
// _SafeStr_8685 = "_-H1G" (String#39677, DoABC#4)


