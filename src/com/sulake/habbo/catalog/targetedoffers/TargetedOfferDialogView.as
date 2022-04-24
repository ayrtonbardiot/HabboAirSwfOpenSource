// by nota

//com.sulake.habbo.catalog.targetedoffers.TargetedOfferDialogView

package com.sulake.habbo.catalog.targetedoffers
{
    import com.sulake.habbo.catalog.targetedoffers.data.TargetedOffer;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.catalog.purse._SafeStr_3226;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import flash.text.StyleSheet;

    public class TargetedOfferDialogView extends OfferView 
    {

        private static const IMAGE_DEFAULT_URL:String = "targetedoffers/offer_default.png";

        private var _SafeStr_4892:int = 1;

        public function TargetedOfferDialogView(_arg_1:OfferController, _arg_2:TargetedOffer)
        {
            super(_arg_1, _arg_2);
        }

        public function buildWindow(_arg_1:String):void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            if (((!(_SafeStr_4360.catalog)) || (!(_SafeStr_4360.catalog.windowManager))))
            {
                return;
            };
            _window = _SafeStr_3133(_SafeStr_4360.catalog.windowManager.buildFromXML(XML(_SafeStr_4360.catalog.assets.getAssetByName(_arg_1).content)));
            if (_SafeStr_3263(_window))
            {
                _SafeStr_3263(_window).title.text = getLocalization(_offer.title);
            };
            var _local_5:ITextWindow = ITextWindow(_window.findChildByName("txt_title"));
            if (_local_5)
            {
                _local_5.text = getLocalization(_offer.title);
            };
            _local_5 = ITextWindow(_window.findChildByName("txt_description"));
            if (_local_5)
            {
                _local_5.text = getLocalization(_offer.description);
                setLinkStyle(_local_5);
            };
            _local_5 = ITextWindow(_window.findChildByName("txt_price_label"));
            if (_local_5)
            {
                _local_5.text = getLocalization("targeted.offer.price.label");
            };
            var _local_6:_SafeStr_24 = _SafeStr_4360.catalog.utils.getPriceMap(_offer, _SafeStr_4892);
            renderPrice(_window, _local_6);
            var _local_3:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_window.findChildByName("bmp_illustration"));
            if (_local_3)
            {
                _local_2 = (_SafeStr_4360.catalog as _SafeStr_19).getProperty("image.library.url");
                _local_4 = getPreviewImageOverride(_offer);
                if (((_local_4 == null) || (_local_4.length == 0)))
                {
                    _local_4 = (((_offer.imageUrl) && (_offer.imageUrl.length > 0)) ? _offer.imageUrl : "targetedoffers/offer_default.png");
                };
                _local_3.assetUri = (_local_2 + _local_4);
            };
            _SafeStr_5966 = getLocalization("targeted.offer.timeleft", "");
            if (_offer.expirationTime == 0)
            {
                if (_window.findChildByName("cnt_time_left"))
                {
                    _window.findChildByName("cnt_time_left").visible = false;
                };
            }
            else
            {
                startUpdateTimer();
            };
            var _local_7:ITextFieldWindow = (_window.findChildByName("quantity_input") as ITextFieldWindow);
            if (_local_7)
            {
                _local_7.addEventListener("WKE_KEY_UP", onQuantityInputEvent);
            };
            _window.procedure = onInput;
            _window.center();
            updatePriceText();
            updateButtonStates();
        }

        private function renderPrice(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_24):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_3:* = _arg_2.getValue("credit");
            _arg_1.findChildByName("txt_price_credits").caption = _local_3.amount;
            var _local_4:* = _arg_2.getValue("activityPoint");
            if (_local_4 != null)
            {
                _arg_1.findChildByName("txt_price_activityPoints").caption = _local_4.amount;
                setActivityPointIconStyle("activityPoints_icon", _arg_1, _local_4.activityPointType);
            }
            else
            {
                _arg_1.findChildByName("txt_price_activityPoints").caption = "0";
                setActivityPointIconStyle("activityPoints_icon", _arg_1, 5);
            };
        }

        private function setActivityPointIconStyle(_arg_1:String, _arg_2:_SafeStr_3133, _arg_3:int):void
        {
            var _local_4:_SafeStr_3109 = _arg_2.findChildByName(_arg_1);
            _local_4.style = _SafeStr_3226.getIconStyleFor(_arg_3, _SafeStr_4360.catalog, true);
        }

        override protected function setTimeLeft(_arg_1:String):void
        {
            var _local_3:ITextWindow = ITextWindow(_window.findChildByName("txt_time_left"));
            if (!_local_3)
            {
                return;
            };
            _local_3.text = _arg_1;
            if (!_SafeStr_5966)
            {
                return;
            };
            var _local_4:int = Math.max(_SafeStr_5966.indexOf("%timeleft%"), 0);
            var _local_2:ITextWindow = ITextWindow(_window.findChildByName("txt_time_left_label_1"));
            if (_local_2)
            {
                _local_2.text = _SafeStr_5966.substr(0, (_local_4 - 1));
            };
            _local_2 = ITextWindow(_window.findChildByName("txt_time_left_label_2"));
            if (_local_2)
            {
                _local_2.text = _SafeStr_5966.substr((_local_4 + 10), _SafeStr_5966.length);
            };
        }

        public function updateButtonStates():void
        {
            var _local_4:ITextWindow = ITextWindow(_window.findChildByName("txt_status"));
            if (!_local_4)
            {
                return;
            };
            var _local_1:Boolean = _offer.checkPurseBalance(_SafeStr_4360.catalog.getPurse(), _SafeStr_4892);
            if (_local_1)
            {
                _local_4.text = "";
            }
            else
            {
                if (_window.findChildByName("btn_buy"))
                {
                    _window.findChildByName("btn_buy").disable();
                };
            };
            if (_window.findChildByName("cnt_quantity"))
            {
                _window.findChildByName("cnt_quantity").visible = (_offer.purchaseLimit > 1);
            };
            if (_window.findChildByName("btn_get_credits"))
            {
                _window.findChildByName("btn_get_credits").visible = (!(_local_1));
            };
            var _local_2:_SafeStr_3109 = _window.findChildByName("btn_buy");
            if (_local_2)
            {
                if (((_local_1) && (isQuantityValid())))
                {
                    _local_2.enable();
                }
                else
                {
                    _local_2.disable();
                };
            };
            var _local_3:IItemListWindow = IItemListWindow(_window.findChildByName("itemlist_buttonbar"));
            if (_local_3)
            {
                _local_3.arrangeListItems();
                _local_3.arrangeListItems();
            };
        }

        private function updatePriceText():void
        {
            var _local_2:ITextWindow = ITextWindow(_window.findChildByName("txt_price_credits"));
            if (_local_2)
            {
                _local_2.text = ((_SafeStr_4892 * _offer.priceInCredits) + "");
            };
            var _local_1:ITextWindow = ITextWindow(_window.findChildByName("txt_price_activityPoints"));
            if (_local_1)
            {
                _local_1.text = ((_SafeStr_4892 * _offer.priceInActivityPoints) + "");
            };
        }

        private function onInput(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (!_SafeStr_4360)
            {
                return;
            };
            if (_arg_1.type == "WME_DOWN")
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                        _SafeStr_4360.minimizeOffer(_offer);
                        return;
                    case "btn_get_credits":
                        _SafeStr_4360.purchaseCredits(_offer);
                        return;
                    case "btn_buy":
                        if (!isQuantityValid())
                        {
                            return;
                        };
                        _SafeStr_4360.showConfirmation(_offer, _SafeStr_4892);
                        return;
                };
            };
        }

        private function isQuantityValid():Boolean
        {
            return ((_SafeStr_4892 >= 1) && (_SafeStr_4892 <= _offer.purchaseLimit));
        }

        private function onQuantityInputEvent(_arg_1:WindowKeyboardEvent):void
        {
            var _local_2:int = parseInt(_arg_1.target.caption);
            if (((((_local_2 == 0) && (!(_arg_1.target.caption == ""))) || (_local_2 > 999)) || (_local_2 > _offer.purchaseLimit)))
            {
                _arg_1.target.caption = _SafeStr_4892.toString();
                return;
            };
            _SafeStr_4892 = _local_2;
            updatePriceText();
            updateButtonStates();
        }

        private function setLinkStyle(_arg_1:ITextWindow):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_3:StyleSheet = new StyleSheet();
            var _local_2:Object = {};
            _local_2.textDecoration = "underline";
            _local_3.setStyle("a:link", _local_2);
            _arg_1.styleSheet = _local_3;
        }

        private function getPreviewImageOverride(_arg_1:TargetedOffer):String
        {
            return (_SafeStr_4360.catalog.getProperty(("targeted.offer.override.preview_image." + _arg_1.id)));
        }


    }
}//package com.sulake.habbo.catalog.targetedoffers

// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3226 = "_-G14" (String#4868, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4892 = "_-P1m" (String#1893, DoABC#4)
// _SafeStr_5966 = "_-e19" (String#6140, DoABC#4)


