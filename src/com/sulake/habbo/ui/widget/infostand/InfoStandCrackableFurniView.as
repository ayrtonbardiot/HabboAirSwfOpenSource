// by nota

//com.sulake.habbo.ui.widget.infostand.InfoStandCrackableFurniView

package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.room.object.data._SafeStr_1674;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.window.components.IRegionWindow;

    public class InfoStandCrackableFurniView extends InfoStandFurniView 
    {

        public function InfoStandCrackableFurniView(_arg_1:InfoStandWidget, _arg_2:String, _arg_3:IHabboCatalog)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function update(_arg_1:RoomWidgetFurniInfoUpdateEvent):void
        {
            super.update(_arg_1);
            var _local_2:_SafeStr_1674 = (_arg_1.stuffData as _SafeStr_1674);
            showButton("use", true);
            _buttons.visible = true;
            setHitsAndTarget(_local_2.hits, _local_2.target);
        }

        private function setHitsAndTarget(_arg_1:int, _arg_2:int):void
        {
            var _local_3:_SafeStr_3109 = _SafeStr_5485.getListItemByName("hits_remaining");
            if (_local_3 == null)
            {
                return;
            };
            _SafeStr_4981.localizations.registerParameter("infostand.crackable_furni.hits_remaining", "hits", String(_arg_1));
            _SafeStr_4981.localizations.registerParameter("infostand.crackable_furni.hits_remaining", "target", String(_arg_2));
            _local_3.visible = true;
            updateWindow();
        }

        override protected function createWindow(_arg_1:String):void
        {
            var _local_2:* = null;
            var _local_5:int;
            var _local_4:XmlAsset = (_SafeStr_4981.assets.getAssetByName("crackable_furni_view") as XmlAsset);
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
                _local_5 = 0;
                while (_local_5 < _buttons.numListItems)
                {
                    _local_2 = _buttons.getListItemAt(_local_5);
                    _local_2.addEventListener("WME_CLICK", onButtonClicked);
                    _local_5++;
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
            var _local_6:IRegionWindow = (_SafeStr_5485.getListItemByName("owner_region") as IRegionWindow);
            if (_local_6 != null)
            {
                _local_6.addEventListener("WME_CLICK", onOwnerRegion);
                _local_6.addEventListener("WME_OVER", onOwnerRegion);
                _local_6.addEventListener("WME_OUT", onOwnerRegion);
            };
        }


    }
}//package com.sulake.habbo.ui.widget.infostand

// _SafeStr_1674 = "_-h1S" (String#30033, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5484 = "_-d1w" (String#599, DoABC#4)
// _SafeStr_5485 = "_-FZ" (String#843, DoABC#4)


