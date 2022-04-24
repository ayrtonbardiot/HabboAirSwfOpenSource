// by nota

//com.sulake.habbo.ui.widget.infostand.InfoStandSongDiskView

package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetSongUpdateEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;

    public class InfoStandSongDiskView extends InfoStandFurniView 
    {

        private var _SafeStr_4222:int = -1;

        public function InfoStandSongDiskView(_arg_1:InfoStandWidget, _arg_2:String, _arg_3:IHabboCatalog)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function dispose():void
        {
            super.dispose();
        }

        override public function update(_arg_1:RoomWidgetFurniInfoUpdateEvent):void
        {
            super.update(_arg_1);
            _SafeStr_4222 = getSongIdFromExtraParam(_arg_1.extraParam);
        }

        public function updateSongInfo(_arg_1:RoomWidgetSongUpdateEvent):void
        {
            if (((_arg_1.type == "RWSUE_DATA_RECEIVED") && (_arg_1.songId == _SafeStr_4222)))
            {
                trackName = _arg_1.songName;
                authorName = _arg_1.songAuthor;
            };
        }

        override protected function createWindow(_arg_1:String):void
        {
            var _local_2:* = null;
            var _local_7:int;
            var _local_5:* = null;
            var _local_10:* = null;
            var _local_4:XmlAsset = (_SafeStr_4981.assets.getAssetByName("songdisk_view") as XmlAsset);
            _window = (_SafeStr_4981.windowManager.buildFromXML((_local_4.content as XML)) as IItemListWindow);
            if (_window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            _SafeStr_5484 = (_window.getListItemByName("info_border") as _SafeStr_3195);
            _buttons = (_window.getListItemByName("button_list") as IItemListWindow);
            if (_SafeStr_5484 != null)
            {
                _SafeStr_5485 = (_SafeStr_5484.findChildByName("infostand_element_list") as IItemListWindow);
            };
            _window.name = _arg_1;
            _SafeStr_4981.mainContainer.addChild(_window);
            var _local_3:_SafeStr_3109 = _SafeStr_5484.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener("WME_CLICK", onClose);
            };
            if (_buttons != null)
            {
                _local_7 = 0;
                while (_local_7 < _buttons.numListItems)
                {
                    _local_2 = _buttons.getListItemAt(_local_7);
                    _local_2.addEventListener("WME_CLICK", onButtonClicked);
                    _local_7++;
                };
            };
            _catalogButton = _SafeStr_5484.findChildByTag("catalog");
            if (_catalogButton != null)
            {
                _catalogButton.addEventListener("WME_CLICK", onCatalogButtonClicked);
            };
            _rentButton = _SafeStr_5484.findChildByName("rent_button");
            if (_rentButton != null)
            {
                _rentButton.addEventListener("WME_CLICK", onRentButtonClicked);
            };
            _extendButton = _SafeStr_5484.findChildByName("extend_button");
            if (_extendButton != null)
            {
                _extendButton.addEventListener("WME_CLICK", onExtendButtonClicked);
            };
            _buyoutButton = _SafeStr_5484.findChildByName("buyout_button");
            if (_buyoutButton != null)
            {
                _buyoutButton.addEventListener("WME_CLICK", onBuyoutButtonClicked);
            };
            var _local_6:_SafeStr_3264 = (_SafeStr_5484.findChildByName("icon_disc") as _SafeStr_3264);
            if (_local_6 != null)
            {
                _local_10 = (_SafeStr_4981.assets.getAssetByName("jb_icon_disc") as BitmapDataAsset);
                _local_5 = (_local_10.content as BitmapData);
                _local_6.bitmap = _local_5.clone();
            };
            var _local_9:_SafeStr_3264 = (_SafeStr_5484.findChildByName("icon_composer") as _SafeStr_3264);
            if (_local_9 != null)
            {
                _local_10 = (_SafeStr_4981.assets.getAssetByName("jb_icon_composer") as BitmapDataAsset);
                _local_5 = (_local_10.content as BitmapData);
                _local_9.bitmap = _local_5.clone();
            };
            var _local_8:IRegionWindow = (_SafeStr_5485.getListItemByName("owner_region") as IRegionWindow);
            if (_local_8 != null)
            {
                _local_8.addEventListener("WME_CLICK", onOwnerRegion);
                _local_8.addEventListener("WME_OVER", onOwnerRegion);
                _local_8.addEventListener("WME_OUT", onOwnerRegion);
            };
        }

        private function set trackName(_arg_1:String):void
        {
            var _local_2:_SafeStr_3133 = (_SafeStr_5485.getListItemByName("trackname_container") as _SafeStr_3133);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:ITextWindow = (_local_2.getChildByName("track_name_text") as ITextWindow);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.text = _arg_1;
            _local_3.visible = true;
            _local_3.height = (_local_3.textHeight + 5);
            updateWindow();
        }

        private function set authorName(_arg_1:String):void
        {
            var _local_2:_SafeStr_3133 = (_SafeStr_5485.getListItemByName("creatorname_container") as _SafeStr_3133);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:ITextWindow = (_local_2.getChildByName("track_creator_text") as ITextWindow);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.text = _arg_1;
            _local_3.visible = true;
            _local_3.height = (_local_3.textHeight + 5);
            updateWindow();
        }

        private function getSongIdFromExtraParam(_arg_1:String):int
        {
            var _local_2:* = null;
            if (_arg_1 != null)
            {
                _local_2 = _arg_1.substr("RWEIEP_SONGDISK".length, _arg_1.length);
                return (parseInt(_local_2));
            };
            return (-1);
        }


    }
}//package com.sulake.habbo.ui.widget.infostand

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4222 = "_-Tb" (String#2462, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5484 = "_-d1w" (String#599, DoABC#4)
// _SafeStr_5485 = "_-FZ" (String#843, DoABC#4)


