// by nota

//com.sulake.habbo.navigator.view.search.results.RoomEntryElementFactory

package com.sulake.habbo.navigator.view.search.results
{
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.navigator.view.search.ViewMode;
    import com.sulake.core.window.components._SafeStr_3195;
    import _-Ja._SafeStr_1569;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.window.utils._SafeStr_3473;
    import com.sulake.core.window.events._SafeStr_3116;
    import flash.geom.Rectangle;
    import _-M1k._SafeStr_994;
    import _-M1k._SafeStr_725;
    import com.sulake.core.window.components.IRegionWindow;

    public class RoomEntryElementFactory 
    {

        public static const TILES_PER_CONTAINER:int = 3;

        private var _navigator:HabboNewNavigator;
        private var _SafeStr_5614:_SafeStr_3133;
        private var _SafeStr_5615:_SafeStr_3133;
        private var _SafeStr_5617:IItemListWindow;
        private var _SafeStr_5616:int;

        public function RoomEntryElementFactory(_arg_1:HabboNewNavigator)
        {
            _navigator = _arg_1;
            _SafeStr_5616 = ViewMode.getViewMode("hotel_view");
        }

        public function set viewMode(_arg_1:int):void
        {
            _SafeStr_5616 = _arg_1;
        }

        public function set rowEntryTemplate(_arg_1:_SafeStr_3133):void
        {
            _SafeStr_5614 = _arg_1;
        }

        public function set tileEntryTemplate(_arg_1:_SafeStr_3133):void
        {
            _SafeStr_5615 = _arg_1;
        }

        public function set tileContainerTemplate(_arg_1:IItemListWindow):void
        {
            _SafeStr_5617 = _arg_1;
        }

        public function get rowEntryTemplateHeight():int
        {
            return (_SafeStr_5614.height);
        }

        public function getNewRowElement(_arg_1:_SafeStr_1569, _arg_2:int, _arg_3:int=-1):_SafeStr_3133
        {
            var _local_4:_SafeStr_3133 = _SafeStr_3133(_SafeStr_5614.clone());
            if (_arg_3 != -1)
            {
                _local_4.width = _arg_3;
            };
            _SafeStr_3195(_local_4).color = RoomEntryUtils.getModulatedBackgroundColor(_arg_2, _SafeStr_3195(_local_4).color);
            updateCommonEntryElements(_local_4, _arg_1, false);
            _local_4.findChildByName("grouphome_icon").visible = (!(_arg_1.groupBadgeCode == ""));
            return (_local_4);
        }

        public function getNewTileElement(_arg_1:_SafeStr_1569, _arg_2:int):_SafeStr_3133
        {
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_SafeStr_5615.clone());
            updateCommonEntryElements(_local_3, _arg_1, true);
            if (_arg_1.groupBadgeCode != "")
            {
                _local_3.findChildByName("room_group_badge").visible = true;
                _SafeStr_3349(_SafeStr_3199(_local_3.findChildByName("room_group_badge")).widget).badgeId = _arg_1.groupBadgeCode;
            };
            if (_arg_1.officialRoomPicRef != null)
            {
                if (_navigator.getBoolean("new.navigator.official.room.thumbnails.in.amazon"))
                {
                    IStaticBitmapWrapperWindow(_local_3.findChildByName("room_pic_placeholder")).assetUri = (_navigator.getProperty("navigator.thumbnail.url_base") + _arg_1.officialRoomPicRef);
                }
                else
                {
                    IStaticBitmapWrapperWindow(_local_3.findChildByName("room_pic_placeholder")).assetUri = (_navigator.getProperty("image.library.url") + _arg_1.officialRoomPicRef);
                };
            }
            else
            {
                IStaticBitmapWrapperWindow(_local_3.findChildByName("room_pic_placeholder")).assetUri = ((_navigator.getProperty("navigator.thumbnail.url_base") + _arg_1.flatId) + ".png");
            };
            return (_local_3);
        }

        private function updateCommonEntryElements(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1569, _arg_3:Boolean):void
        {
            _arg_1.findChildByName("room_usercount").caption = _arg_2.userCount.toString();
            _arg_1.findChildByName("room_name").caption = ((ViewMode.isEventViewMode(_SafeStr_5616)) ? _arg_2.roomAdName : _arg_2.roomName);
            _arg_1.findChildByName("go_to_room_region").id = _arg_2.flatId;
            _arg_1.findChildByName("go_to_room_region").addEventListener("WME_CLICK", onGoButtonClicked);
            _arg_1.findChildByName("go_to_room_region").addEventListener("WME_OVER", ((_arg_3) ? onTileGoToRoomMouseOver : onGoToRoomMouseOver));
            _arg_1.findChildByName("info_popup_click_region").id = _arg_2.flatId;
            _arg_1.findChildByName("info_popup_click_region").addEventListener("WME_CLICK", onMouseClicked);
            _arg_1.findChildByName("info_popup_click_region").addEventListener("WME_OVER", onRoomRoomInfoMouseOver);
            _SafeStr_3195(_arg_1.findChildByName("room_info_usercount_border")).color = _SafeStr_3473.getUserCountColor(_arg_2.userCount, _arg_2.maxUserCount);
            IStaticBitmapWrapperWindow(_arg_1.findChildByName("doormode_icon")).assetUri = RoomEntryUtils.getDoorModeIconAsset(_arg_2.doorMode);
        }

        public function getNewTileContainerElement():IItemListWindow
        {
            return (_SafeStr_5617.clone() as IItemListWindow);
        }

        private function onGoButtonClicked(_arg_1:_SafeStr_3116):void
        {
            _navigator.goToRoom(_arg_1.window.id);
        }

        private function onMouseClicked(_arg_1:_SafeStr_3116):void
        {
            var _local_2:Rectangle = new Rectangle();
            _arg_1.window.getGlobalRectangle(_local_2);
            _navigator.view.showRoomInfoBubbleAt(_navigator.currentResults.findGuestRoom(_arg_1.window.id), _local_2.right, (((_local_2.bottom - _local_2.top) / 2) + _local_2.top));
        }

        private function onRoomRoomInfoMouseOver(_arg_1:_SafeStr_3116):void
        {
            var _local_2:* = null;
            if (_navigator.view.isRoomInfoBubbleVisible)
            {
                _local_2 = new Rectangle();
                _arg_1.window.getGlobalRectangle(_local_2);
                _navigator.view.showRoomInfoBubbleAt(_navigator.currentResults.findGuestRoom(_arg_1.window.id), _local_2.right, (((_local_2.bottom - _local_2.top) / 2) + _local_2.top), true);
            };
        }

        private function onTileGoToRoomMouseOver(_arg_1:_SafeStr_3116):void
        {
            var _local_2:* = null;
            if (_navigator.view.isRoomInfoBubbleVisible)
            {
                _local_2 = new Rectangle();
                _arg_1.window.getGlobalRectangle(_local_2);
                _navigator.view.showRoomInfoBubbleAt(_navigator.currentResults.findGuestRoom(_arg_1.window.id), (_local_2.right - 6), ((((_local_2.bottom - _local_2.top) / 2) + _local_2.top) + 56), true);
            };
        }

        private function onGoToRoomMouseOver(_arg_1:_SafeStr_3116):void
        {
            var _local_2:* = null;
            if (_navigator.view.isRoomInfoBubbleVisible)
            {
                _local_2 = new Rectangle();
                _arg_1.window.getGlobalRectangle(_local_2);
                _navigator.view.showRoomInfoBubbleAt(_navigator.currentResults.findGuestRoom(_arg_1.window.id), (_local_2.right + 20), (((_local_2.bottom - _local_2.top) / 2) + _local_2.top), true);
            };
        }

        private function onOwnerLinkClicked(_arg_1:_SafeStr_3116):void
        {
            _navigator.getExtendedProfile(_arg_1.window.id);
        }

        private function onGroupLinkClicked(_arg_1:_SafeStr_3116):void
        {
            _navigator.getGuildInfo(_arg_1.window.id);
        }

        private function onFavoriteRegionClicked(_arg_1:_SafeStr_3116):void
        {
            var _local_2:Boolean = _navigator.legacyNavigator.isRoomFavorite(_arg_1.window.id);
            if (_local_2)
            {
                _navigator.communication.connection.send(new _SafeStr_994(_arg_1.window.id));
            }
            else
            {
                _navigator.communication.connection.send(new _SafeStr_725(_arg_1.window.id));
            };
            IStaticBitmapWrapperWindow(IRegionWindow(_arg_1.window).findChildByName("favourite_icon")).assetUri = RoomEntryUtils.getFavoriteIcon((!(_local_2)));
        }


    }
}//package com.sulake.habbo.navigator.view.search.results

// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_3473 = "_-va" (String#18441, DoABC#4)
// _SafeStr_5614 = "_-y1u" (String#15516, DoABC#4)
// _SafeStr_5615 = "_-N1f" (String#21318, DoABC#4)
// _SafeStr_5616 = "_-qD" (String#11561, DoABC#4)
// _SafeStr_5617 = "_-22w" (String#20309, DoABC#4)
// _SafeStr_725 = "_-11Z" (String#10180, DoABC#4)
// _SafeStr_994 = "_-K4" (String#9037, DoABC#4)


