// by nota

//com.sulake.habbo.quest.seasonalcalendar.CatalogPromo

package com.sulake.habbo.quest.seasonalcalendar
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.session.product._SafeStr_1706;
    import com.sulake.habbo.quest.HabboQuestEngine;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.communication.connection.IConnection;
    import _-AE._SafeStr_1611;
    import _-AE._SafeStr_674;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-AE._SafeStr_743;
    import _-q1n._SafeStr_276;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.roomevents.Util;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.room.utils.Vector3d;
    import flash.display.BitmapData;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Rectangle;
    import flash.geom.Point;

    public class CatalogPromo implements _SafeStr_13, _SafeStr_3140, _SafeStr_1706 
    {

        private var _questEngine:HabboQuestEngine;
        private var _window:_SafeStr_3133;
        private var _connection:IConnection;
        private var _SafeStr_4079:MainWindow;
        private var _SafeStr_5387:_SafeStr_1611 = null;
        private var _offerId:int = -1;
        private var _SafeStr_4786:int = -1;
        private var _SafeStr_6787:_SafeStr_674 = null;
        private var _SafeStr_6785:IMessageEvent = null;
        private var _SafeStr_6786:IMessageEvent = null;

        public function CatalogPromo(_arg_1:HabboQuestEngine, _arg_2:MainWindow)
        {
            _questEngine = _arg_1;
            _SafeStr_4079 = _arg_2;
        }

        public function dispose():void
        {
            if (_connection)
            {
                if (_SafeStr_6785)
                {
                    _connection.removeMessageEvent(_SafeStr_6785);
                    _SafeStr_6785 = null;
                };
                if (_SafeStr_6786)
                {
                    _connection.removeMessageEvent(_SafeStr_6786);
                    _SafeStr_6786 = null;
                };
                _connection = null;
            };
            _questEngine = null;
        }

        public function get disposed():Boolean
        {
            return (_questEngine == null);
        }

        public function onActivityPoints(_arg_1:int, _arg_2:int):void
        {
            if (_arg_1 == getActivityPointType())
            {
                _questEngine.localization.registerParameter("quests.seasonalcalendar.promo.balance", "amount", ("" + _arg_2));
                if (_window != null)
                {
                    refresh();
                };
            };
        }

        private function getActivityPointType():int
        {
            var _local_1:String = _questEngine.configuration.getProperty("seasonalQuestCalendar.currency");
            return ((isNaN(_local_1)) ? 0 : _local_1);
        }

        public function prepare(_arg_1:_SafeStr_3263):void
        {
            _window = _SafeStr_3133(_arg_1.findChildByName("catalog_promo_cont"));
            _window.findChildByName("buy_button").disable();
            _window.findChildByName("buy_button").procedure = onBuyButton;
            _connection = _questEngine.communication.connection;
            if (_connection != null)
            {
                _SafeStr_6785 = new _SafeStr_674(onDailyOfferMessage);
                _SafeStr_6786 = new _SafeStr_743(onCatalogPublished);
                _connection.addMessageEvent(_SafeStr_6785);
                _connection.addMessageEvent(_SafeStr_6786);
                _connection.send(new _SafeStr_276());
            };
        }

        public function refresh():void
        {
            var _local_5:* = null;
            var _local_2:* = null;
            var _local_4:ITextWindow = ITextWindow(_window.findChildByName("your_balance_txt"));
            var _local_1:_SafeStr_3133 = _SafeStr_3133(_window.findChildByName("currency_icon_cont"));
            _local_1.x = (_local_4.x + _local_4.width);
            Util.hideChildren(_local_1);
            var _local_3:_SafeStr_3109 = _local_1.findChildByName(("currency_icon_" + getActivityPointType()));
            if (_local_3 != null)
            {
                _local_3.visible = true;
            };
            if (_SafeStr_5387 != null)
            {
                _local_5 = null;
                _local_2 = null;
                if (_SafeStr_5387.productType == "i")
                {
                    _local_2 = _questEngine.roomEngine.getWallItemImage(_SafeStr_5387.furniClassId, new Vector3d(90, 0, 0), 64, this, 0, _SafeStr_5387.extraParam);
                }
                else
                {
                    if (_SafeStr_5387.productType == "s")
                    {
                        _local_2 = _questEngine.roomEngine.getFurnitureImage(_SafeStr_5387.furniClassId, new Vector3d(90, 0, 0), 64, this);
                    };
                };
                if (((!(_local_2 == null)) && (!(_local_2.data == null))))
                {
                    setPromoFurniImage(_local_2.data);
                };
            };
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            setPromoFurniImage(_arg_2);
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        private function onBuyButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_14.log("Buy button clicked");
                if (_offerId != -1)
                {
                    _questEngine.catalog.openCatalogPageById(_SafeStr_4786, _offerId, "NORMAL");
                };
            };
        }

        private function onDailyOfferMessage(_arg_1:_SafeStr_674):void
        {
            _window.findChildByName("buy_button").enable();
            var _local_2:_SafeStr_3182 = _questEngine.sessionDataManager.getProductData(_arg_1.offer.localizationId);
            if (_local_2 != null)
            {
                ITextWindow(_window.findChildByName("promo_info")).text = _local_2.name;
                _SafeStr_4786 = _arg_1.pageId;
                _offerId = _arg_1.offer.offerId;
                if (_arg_1.offer.products.length > 0)
                {
                    _SafeStr_5387 = _SafeStr_1611(_arg_1.offer.products[0]);
                    refresh();
                };
            }
            else
            {
                if (_SafeStr_6787 == null)
                {
                    _SafeStr_6787 = _arg_1;
                    _questEngine.sessionDataManager.addProductsReadyEventListener(this);
                };
            };
        }

        public function productDataReady():void
        {
            onDailyOfferMessage(_SafeStr_6787);
        }

        private function setPromoFurniImage(_arg_1:BitmapData):void
        {
            var _local_5:_SafeStr_3264 = _SafeStr_3264(_window.findChildByName("furni_preview"));
            var _local_2:BitmapData = new BitmapData(_local_5.width, _local_5.height, true, 0);
            var _local_3:Rectangle = _arg_1.rect;
            if (_local_3.width > _local_2.rect.width)
            {
                _local_3.x = ((_local_3.width - _local_2.rect.width) / 2);
                _local_3.width = _local_2.rect.width;
            };
            if (_local_3.height > _local_2.rect.height)
            {
                _local_3.y = ((_local_3.height - _local_2.rect.height) / 2);
                _local_3.height = _local_2.rect.height;
            };
            var _local_4:Point = new Point(0, 0);
            if (_local_2.rect.width > _local_3.width)
            {
                _local_4.x = ((_local_2.rect.width - _local_3.width) / 2);
            };
            if (_local_2.rect.height > _local_3.height)
            {
                _local_4.y = ((_local_2.rect.height - _local_3.height) / 2);
            };
            _local_2.copyPixels(_arg_1, _local_3, _local_4);
            _local_5.bitmap = _local_2;
        }

        private function onCatalogPublished(_arg_1:IMessageEvent):void
        {
            if (_connection != null)
            {
                _connection.send(new _SafeStr_276());
            };
        }


    }
}//package com.sulake.habbo.quest.seasonalcalendar

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1611 = "_-m6" (String#8890, DoABC#4)
// _SafeStr_1706 = "_-817" (String#5080, DoABC#4)
// _SafeStr_276 = "_-32p" (String#19382, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4079 = "_-f1q" (String#323, DoABC#4)
// _SafeStr_4786 = "_-l1k" (String#2541, DoABC#4)
// _SafeStr_5387 = "_-z1a" (String#3888, DoABC#4)
// _SafeStr_674 = "_-P1M" (String#21112, DoABC#4)
// _SafeStr_6785 = "_-025" (String#10260, DoABC#4)
// _SafeStr_6786 = "_-r1N" (String#9807, DoABC#4)
// _SafeStr_6787 = "_-ub" (String#14509, DoABC#4)
// _SafeStr_743 = "_-Y1X" (String#8884, DoABC#4)


