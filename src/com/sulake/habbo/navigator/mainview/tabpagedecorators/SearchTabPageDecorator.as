// by nota

//com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator

package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;

    public class SearchTabPageDecorator implements ITabPageDecorator 
    {

        private var _navigator:HabboNavigator;

        public function SearchTabPageDecorator(_arg_1:HabboNavigator)
        {
            _navigator = _arg_1;
        }

        public function refreshCustomContent(_arg_1:_SafeStr_3133):void
        {
            refreshRoomCompetitionsHeader(_arg_1);
        }

        public function tabSelected():void
        {
        }

        public function refreshFooter(_arg_1:_SafeStr_3133):void
        {
        }

        public function navigatorOpenedWhileInTab():void
        {
            _navigator.mainViewCtrl.open();
        }

        public function get filterCategory():String
        {
            return (null);
        }

        private function refreshRoomCompetitionsHeader(_arg_1:_SafeStr_3133):void
        {
            var _local_2:_SafeStr_3133 = (_arg_1.getChildByName("room_competitions_header") as _SafeStr_3133);
            if (((_navigator.data == null) || (_navigator.data.competitionRoomsData == null)))
            {
                _local_2.visible = false;
                return;
            };
            var _local_6:int = _navigator.data.competitionRoomsData.pageIndex;
            var _local_4:int = _navigator.data.competitionRoomsData.pageCount;
            var _local_5:int = (_local_6 + 1);
            if (_local_4 < 2)
            {
                _local_2.visible = false;
                return;
            };
            _local_2.visible = true;
            _navigator.registerParameter("navigator.roomcompetitionspager", "page", ("" + _local_5));
            _navigator.registerParameter("navigator.roomcompetitionspager", "total", ("" + _local_4));
            var _local_3:_SafeStr_3109 = _local_2.findChildByName("next_button");
            var _local_7:_SafeStr_3109 = _local_2.findChildByName("prev_button");
            _local_3.visible = (_local_5 < _local_4);
            _local_7.visible = (_local_5 > 1);
            _local_3.procedure = onNextButton;
            _local_7.procedure = onPrevButton;
        }

        private function onNextButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((_arg_1.type == "WME_CLICK") && (!(_navigator.data.competitionRoomsData == null))))
            {
                _navigator.performCompetitionRoomsSearch(_navigator.data.competitionRoomsData.goalId, (_navigator.data.competitionRoomsData.pageIndex + 1));
            };
        }

        private function onPrevButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((_arg_1.type == "WME_CLICK") && (!(_navigator.data.competitionRoomsData == null))))
            {
                _navigator.performCompetitionRoomsSearch(_navigator.data.competitionRoomsData.goalId, (_navigator.data.competitionRoomsData.pageIndex - 1));
            };
        }

        public function setSubSelection(_arg_1:int):void
        {
        }

        public function processSearchParam(_arg_1:String):String
        {
            return (_arg_1);
        }


    }
}//package com.sulake.habbo.navigator.mainview.tabpagedecorators

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


