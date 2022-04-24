// by nota

//com.sulake.habbo.catalog.purchase.RentConfirmationWindow

package com.sulake.habbo.catalog.purchase
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.room._SafeStr_3140;
    import _-81g._SafeStr_415;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import _-z1k._SafeStr_1296;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.core.window.components._SafeStr_3264;
    import _-02a._SafeStr_279;
    import com.sulake.habbo.room.IRoomEngine;
    import _-02a._SafeStr_939;
    import _-02a._SafeStr_552;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import flash.display.BitmapData;

    public class RentConfirmationWindow implements _SafeStr_13, _SafeStr_3140 
    {

        private static const MODE_INFOSTAND:int = 1;
        private static const MODE_INVENTORY:int = 2;
        private static const MODE_CATALOGUE:int = 3;

        private var _disposed:Boolean;
        private var _offerMessageEvent:_SafeStr_415;
        private var _window:_SafeStr_3133;
        private var _isBuyout:Boolean;
        private var _SafeStr_3820:int = -1;
        private var _catalog:HabboCatalog;
        private var _SafeStr_4362:_SafeStr_3130;
        private var _SafeStr_3771:int;
        private var _SafeStr_5377:int = -1;
        private var _SafeStr_4863:int;

        public function RentConfirmationWindow(_arg_1:HabboCatalog)
        {
            _catalog = _arg_1;
            _offerMessageEvent = new _SafeStr_415(onFurniRentOrBuyoutOffer);
            _catalog.connection.addMessageEvent(_offerMessageEvent);
        }

        private function onFurniRentOrBuyoutOffer(_arg_1:_SafeStr_415):void
        {
            var _local_3:* = null;
            if (_SafeStr_4362 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1296 = _arg_1.getParser();
            if (_SafeStr_4362.fullName != _local_2.furniTypeName)
            {
                return;
            };
            _isBuyout = _local_2.buyout;
            if (_catalog.getPurse().credits < _local_2.priceInCredits)
            {
                _catalog.showNotEnoughCreditsAlert();
                return;
            };
            if (_catalog.getPurse().getActivityPointsForType(_local_2.activityPointType) < _local_2.priceInActivityPoints)
            {
                _catalog.showNotEnoughActivityPointsAlert(_local_2.activityPointType);
                return;
            };
            _window = (_catalog.windowManager.buildFromXML((_catalog.assets.getAssetByName("rent_confirmation").content as XML)) as _SafeStr_3133);
            if (_local_2.priceInCredits > 0)
            {
                _window.findChildByName("price_amount").caption = _local_2.priceInCredits.toString();
                IStaticBitmapWrapperWindow(_window.findChildByName("price_type")).assetUri = "toolbar_credit_icon_0";
            }
            else
            {
                _window.findChildByName("price_amount").caption = _local_2.priceInActivityPoints.toString();
            };
            if (_isBuyout)
            {
                _window.caption = "${rent.confirmation.title.buyout}";
                _window.findChildByName("rental_description").visible = false;
                _window.findChildByName("ok_button").caption = "${catalog.purchase_confirmation.buy}";
            };
            _window.findChildByName("furni_name").caption = _SafeStr_4362.localizedName;
            IItemListWindow(_window.findChildByName("content_list")).arrangeListItems();
            _window.center();
            _window.procedure = windowProcedure;
            switch (_SafeStr_4362.type)
            {
                case "s":
                    _local_3 = roomEngine.getFurnitureImage(_SafeStr_4362.id, new Vector3d(90, 0, 0), 64, this);
                    break;
                case "i":
                    _local_3 = roomEngine.getWallItemImage(_SafeStr_4362.id, new Vector3d(90, 0, 0), 64, this);
            };
            _SafeStr_3264(_window.findChildByName("image")).bitmap = _local_3.data;
            _SafeStr_3820 = _local_3.id;
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            close();
            if (_offerMessageEvent != null)
            {
                _catalog.connection.removeMessageEvent(_offerMessageEvent);
                _offerMessageEvent = null;
            };
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function show(_arg_1:_SafeStr_3130, _arg_2:Boolean, _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):void
        {
            close();
            _SafeStr_4362 = _arg_1;
            _SafeStr_5377 = _arg_3;
            _SafeStr_4863 = _arg_4;
            if (_arg_5)
            {
                _SafeStr_3771 = 3;
            }
            else
            {
                if (_SafeStr_5377 > -1)
                {
                    _SafeStr_3771 = 1;
                }
                else
                {
                    _SafeStr_3771 = 2;
                };
            };
            var _local_6:* = (_arg_1.type == "i");
            _catalog.connection.send(new _SafeStr_279(_local_6, _arg_1.fullName, _arg_2));
        }

        private function get roomEngine():IRoomEngine
        {
            return (_catalog.roomEngine);
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((!(_arg_1.type == "WME_CLICK")) || (_window == null)))
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "cancel_button":
                case "header_button_close":
                    close();
                    return;
                case "ok_button":
                    switch (_SafeStr_3771)
                    {
                        case 1:
                            _catalog.connection.send(new _SafeStr_939((_SafeStr_4362.type == "i"), _SafeStr_5377, _isBuyout));
                            break;
                        case 2:
                            _catalog.connection.send(new _SafeStr_552(_SafeStr_4863, _isBuyout));
                            break;
                        case 3:
                            _catalog.purchaseOffer(_SafeStr_4362.rentOfferId);
                        default:
                    };
                    close();
                    return;
            };
        }

        private function close():void
        {
            if (_window == null)
            {
                return;
            };
            _window.dispose();
            _window = null;
            _SafeStr_3820 = -1;
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            if (((!(_window == null)) && (_arg_1 == _SafeStr_3820)))
            {
                _SafeStr_3264(_window.findChildByName("image")).bitmap = _arg_2;
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }


    }
}//package com.sulake.habbo.catalog.purchase

// _SafeStr_1296 = "_-V1W" (String#36382, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_279 = "_-210" (String#29297, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3771 = "_-9Y" (String#962, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_415 = "_-8u" (String#22253, DoABC#4)
// _SafeStr_4362 = "_-vN" (String#1324, DoABC#4)
// _SafeStr_4863 = "_-A1K" (String#9940, DoABC#4)
// _SafeStr_5377 = "_-s10" (String#15421, DoABC#4)
// _SafeStr_552 = "_-fM" (String#30031, DoABC#4)
// _SafeStr_939 = "_-Iu" (String#30322, DoABC#4)


