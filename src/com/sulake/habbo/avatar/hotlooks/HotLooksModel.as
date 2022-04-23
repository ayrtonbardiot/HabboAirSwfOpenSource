// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.hotlooks.HotLooksModel

package com.sulake.habbo.avatar.hotlooks
{
    import com.sulake.habbo.avatar.common.CategoryBaseModel;
    import com.sulake.habbo.avatar.common._SafeStr_3301;
    import flash.utils.Dictionary;
    import _-B1i._SafeStr_1034;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import _-ZA._SafeStr_596;
    import _-B1i._SafeStr_1530;
    import com.sulake.habbo.avatar.wardrobe.Outfit;
    import com.sulake.habbo.avatar.common.CategoryData;
    import com.sulake.habbo.avatar.wardrobe.*;

    public class HotLooksModel extends CategoryBaseModel implements _SafeStr_3301 
    {

        public static const CATEGORY_HOT_LOOKS:String = "hot_looks";
        public static const CATEGORY_MY_LOOKS:String = "my_looks";
        private static const MAXIMUM_HOT_LOOKS:int = 20;

        private var _SafeStr_5647:Dictionary;
        private var _SafeStr_5648:_SafeStr_1034;

        public function HotLooksModel(_arg_1:HabboAvatarEditor)
        {
            super(_arg_1);
            _SafeStr_5647 = new Dictionary();
            _SafeStr_5647["M"] = [];
            _SafeStr_5647["F"] = [];
            _SafeStr_5647["M.index"] = 0;
            _SafeStr_5647["F.index"] = 0;
            requestHotLooks(_arg_1);
        }

        private function requestHotLooks(_arg_1:HabboAvatarEditor):void
        {
            _SafeStr_5648 = new _SafeStr_1034(onHotLooksMessage);
            _arg_1.manager.communication.addHabboConnectionMessageEvent(_SafeStr_5648);
            _arg_1.manager.communication.connection.send(new _SafeStr_596(20));
        }

        private function onHotLooksMessage(_arg_1:_SafeStr_1034):void
        {
            for each (var _local_2:_SafeStr_1530 in _arg_1.getParser().hotLooks)
            {
                (_SafeStr_5647[_local_2.gender.toUpperCase()] as Array).push(new Outfit(_SafeStr_4360, _local_2.figureString, _local_2.gender));
            };
        }

        override public function dispose():void
        {
            super.dispose();
            if (_SafeStr_5648)
            {
                controller.manager.communication.removeHabboConnectionMessageEvent(_SafeStr_5648);
                _SafeStr_5648 = null;
            };
            _SafeStr_5647 = null;
        }

        override protected function init():void
        {
            if (!_SafeStr_3882)
            {
                _SafeStr_3882 = new HotLooksView(this);
            };
            _SafeStr_3882.init();
            _SafeStr_3883 = true;
        }

        public function selectHotLook(_arg_1:int):void
        {
            var _local_2:Array = _SafeStr_5647[_SafeStr_4360.gender];
            var _local_3:Outfit = _local_2[_arg_1];
            if (_local_3 != null)
            {
                if (_local_3.figure == "")
                {
                    return;
                };
                _SafeStr_4360.loadAvatarInEditor(_local_3.figure, _local_3.gender, _SafeStr_4360.clubMemberLevel);
            };
        }

        public function get hotLooks():Array
        {
            return (_SafeStr_5647[_SafeStr_4360.gender]);
        }

        override public function switchCategory(_arg_1:String=""):void
        {
        }

        override public function getCategoryData(_arg_1:String):CategoryData
        {
            return (null);
        }

        override public function selectPart(_arg_1:String, _arg_2:int):void
        {
        }


    }
}//package com.sulake.habbo.avatar.hotlooks

// _SafeStr_1034 = "_-z1W" (String#19363, DoABC#4)
// _SafeStr_1530 = "_-A1U" (String#33936, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_5647 = "_-u9" (String#5986, DoABC#4)
// _SafeStr_5648 = "_-D6" (String#9305, DoABC#4)
// _SafeStr_596 = "_-32c" (String#30306, DoABC#4)


