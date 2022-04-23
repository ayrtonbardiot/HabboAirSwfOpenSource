// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoDiscountValueItem

package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem
{
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.UpdateableExtraInfoListItem;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.HabboCatalog;
    import flash.utils.Timer;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.HabboCatalogUtils;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.catalog.purse._SafeStr_3226;
    import flash.events.TimerEvent;
    import com.sulake.core.assets.BitmapDataAsset;

    public class ExtraInfoDiscountValueItem extends UpdateableExtraInfoListItem 
    {

        private static const ELEMENT_SPLASH_STAR:String = "icon_splash_bitmap";
        private static const _SafeStr_8328:String = "icon_bitmap";
        private static const _SafeStr_8329:String = "total_currency_value_left";
        private static const _SafeStr_8330:String = "total_currency_icon_left";
        private static const ELEMENT_TOTAL_LEFT_CURRENCY_STRIKETHROUGH:String = "striketrough_total_currency_left";
        private static const _SafeStr_8331:String = "total_currency_value_right";
        private static const _SafeStr_8332:String = "total_currency_icon_right";
        private static const ELEMENT_TOTAL_RIGHT_CURRENCY_STRIKETHROUGH:String = "striketrough_total_currency_right";
        private static const _SafeStr_8333:String = "discount_currency_value_left";
        private static const _SafeStr_8334:String = "discount_currency_icon_left";
        private static const _SafeStr_8335:String = "discount_currency_value_right";
        private static const _SafeStr_8336:String = "discount_currency_icon_right";
        private static const STRIKETHROUGH_LEFT_MARGIN:int = 4;
        private static const STRIKETHROUGH_RIGHT_MARGIN:int = 20;

        private var _window:_SafeStr_3133 = null;
        private var _SafeStr_6974:Boolean = true;
        private var _catalog:HabboCatalog;
        private var _starAnimationOffset:int = 0;
        private var _SafeStr_6972:Timer;
        private var _SafeStr_6977:Boolean;
        private var _SafeStr_6976:Boolean;
        private var _SafeStr_6975:Boolean;
        private var _SafeStr_6973:Boolean = false;

        public function ExtraInfoDiscountValueItem(_arg_1:int, _arg_2:ExtraInfoItemData, _arg_3:HabboCatalog)
        {
            super(null, _arg_1, _arg_2, 1, true);
            _catalog = _arg_3;
            _SafeStr_6972 = new Timer(150);
            _SafeStr_6972.addEventListener("timer", starAnimationTimerEvent);
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_6972 != null)
                {
                    _SafeStr_6972.stop();
                    _SafeStr_6972 = null;
                };
                _catalog = null;
                super.dispose();
            };
        }

        override public function update(_arg_1:ExtraInfoItemData):void
        {
            super.update(_arg_1);
            _SafeStr_6977 = false;
            _SafeStr_6976 = false;
            _SafeStr_6975 = false;
            if (((_arg_1.priceCredits > 0) && (_arg_1.priceActivityPoints > 0)))
            {
                _SafeStr_6977 = true;
            }
            else
            {
                if (((_arg_1.priceActivityPoints > 0) && (_arg_1.priceCredits == 0)))
                {
                    _SafeStr_6975 = true;
                }
                else
                {
                    _SafeStr_6976 = true;
                };
            };
            _SafeStr_6974 = true;
            render();
            if (!_SafeStr_6973)
            {
                setCurrencyIcons();
            };
        }

        override public function getRenderedWindow():_SafeStr_3133
        {
            if (_SafeStr_6974)
            {
                render();
            };
            return (_window);
        }

        private function createWindow():void
        {
            _window = _SafeStr_3133(_catalog.utils.createWindow("discountValueItem"));
            setElementBitmap("icon_bitmap", "thumb_up");
            startSplashAnimation();
        }

        private function render():void
        {
            if (_window == null)
            {
                createWindow();
            };
            updateColumns();
            updatePriceIndicators();
            updateStrikeThroughElements();
            _SafeStr_6974 = false;
        }

        private function updateColumns():void
        {
            if (((_SafeStr_6975) || (_SafeStr_6976)))
            {
                setLeftColumnVisibility(false);
            }
            else
            {
                setLeftColumnVisibility(true);
            };
        }

        private function setCurrencyIcons():void
        {
            if (_SafeStr_6977)
            {
                setIconStyle("total_currency_icon_left", -1);
                setIconStyle("discount_currency_icon_left", -1);
            };
            if (_SafeStr_6976)
            {
                setIconStyle("total_currency_icon_right", -1);
                setIconStyle("discount_currency_icon_right", -1);
            }
            else
            {
                setIconStyle("total_currency_icon_right", data.activityPointType);
                setIconStyle("discount_currency_icon_right", data.activityPointType);
            };
            _SafeStr_6973 = true;
        }

        private function updatePriceIndicators():void
        {
            if (_SafeStr_6977)
            {
                setElementText("total_currency_value_left", (data.quantity * data.priceCredits).toString());
                setElementText("discount_currency_value_left", ((data.quantity * data.priceCredits) - data.discountPriceCredits).toString());
            };
            if (_SafeStr_6976)
            {
                setElementText("total_currency_value_right", (data.quantity * data.priceCredits).toString());
                setElementText("discount_currency_value_right", ((data.quantity * data.priceCredits) - data.discountPriceCredits).toString());
            }
            else
            {
                setElementText("total_currency_value_right", (data.quantity * data.priceActivityPoints).toString());
                setElementText("discount_currency_value_right", ((data.quantity * data.priceActivityPoints) - data.discountPriceActivityPoints).toString());
            };
        }

        private function updateStrikeThroughElements():void
        {
            var _local_4:ITextWindow = ITextWindow(_window.findChildByName("total_currency_value_left"));
            var _local_2:int = ((_local_4.x + _local_4.width) - _local_4.textWidth);
            var _local_5:_SafeStr_3133 = _SafeStr_3133(_window.findChildByName("striketrough_total_currency_left"));
            _local_5.x = (_local_2 - 4);
            _local_5.width = ((4 + _local_4.textWidth) + 20);
            var _local_1:ITextWindow = ITextWindow(_window.findChildByName("total_currency_value_right"));
            var _local_3:int = ((_local_1.x + _local_1.width) - _local_1.textWidth);
            var _local_6:_SafeStr_3133 = _SafeStr_3133(_window.findChildByName("striketrough_total_currency_right"));
            _local_6.x = (_local_3 - 4);
            _local_6.width = ((4 + _local_1.textWidth) + 20);
        }

        private function setElementText(_arg_1:String, _arg_2:String):void
        {
            _window.findChildByName(_arg_1).caption = _arg_2;
        }

        private function setElementBitmap(_arg_1:String, _arg_2:String):void
        {
            var _local_4:_SafeStr_3264 = _SafeStr_3264(_window.findChildByName(_arg_1));
            var _local_3:BitmapData = BitmapData(_catalog.assets.getAssetByName(_arg_2).content);
            HabboCatalogUtils.replaceCenteredImage(_local_4, _local_3);
        }

        private function setIconStyle(_arg_1:String, _arg_2:int):void
        {
            var _local_3:_SafeStr_3109 = _window.findChildByName(_arg_1);
            _local_3.style = _SafeStr_3226.getIconStyleFor(_arg_2, _catalog, false);
        }

        private function setLeftColumnVisibility(_arg_1:Boolean):void
        {
            var _local_2:Array = ["discount_currency_icon_left", "discount_currency_value_left", "total_currency_icon_left", "striketrough_total_currency_left", "total_currency_value_left"];
            for each (var _local_3:String in _local_2)
            {
                _window.findChildByName(_local_3).visible = _arg_1;
            };
        }

        private function startSplashAnimation():void
        {
            var _local_1:_SafeStr_3264 = _SafeStr_3264(_window.findChildByName("icon_splash_bitmap"));
            _local_1.bitmap = new BitmapData(_local_1.width, _local_1.height, true, 0);
            starAnimationTimerEvent(new TimerEvent("timer"));
            _SafeStr_6972.start();
        }

        private function starAnimationTimerEvent(_arg_1:TimerEvent):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (_window != null)
            {
                _local_2 = _SafeStr_3264(_window.findChildByName("icon_splash_bitmap"));
                _local_3 = _catalog.assets.getAssetByName(("bundle_discount_star_" + _starAnimationOffset));
                HabboCatalogUtils.replaceCenteredImage(_local_2, BitmapData(_local_3.content), BitmapDataAsset(_local_3).rectangle);
                if (++_starAnimationOffset > 7)
                {
                    _starAnimationOffset = 0;
                };
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3226 = "_-G14" (String#4868, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_6972 = "_-P1T" (String#8004, DoABC#4)
// _SafeStr_6973 = "_-m1o" (String#21690, DoABC#4)
// _SafeStr_6974 = "_-41T" (String#6033, DoABC#4)
// _SafeStr_6975 = "_-c1i" (String#12282, DoABC#4)
// _SafeStr_6976 = "_-Hs" (String#9139, DoABC#4)
// _SafeStr_6977 = "_-b0" (String#11237, DoABC#4)
// _SafeStr_8328 = "_-J1j" (String#38741, DoABC#4)
// _SafeStr_8329 = "_-B1B" (String#32103, DoABC#4)
// _SafeStr_8330 = "_-9c" (String#38728, DoABC#4)
// _SafeStr_8331 = "_-f" (String#40056, DoABC#4)
// _SafeStr_8332 = "_-I1i" (String#39366, DoABC#4)
// _SafeStr_8333 = "_-w1z" (String#32856, DoABC#4)
// _SafeStr_8334 = "_-iD" (String#32386, DoABC#4)
// _SafeStr_8335 = "_-61" (String#38622, DoABC#4)
// _SafeStr_8336 = "_-32A" (String#33101, DoABC#4)


