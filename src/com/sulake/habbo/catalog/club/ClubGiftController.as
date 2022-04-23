// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.club.ClubGiftController

package com.sulake.habbo.catalog.club
{
    import com.sulake.habbo.catalog.viewer.widgets.ClubGiftWidget;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.catalog.HabboCatalog;
    import _-q1n._SafeStr_709;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import _-q1n._SafeStr_566;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.habbo.catalog.purse._SafeStr_3142;

    public class ClubGiftController 
    {

        private var _SafeStr_4981:ClubGiftWidget;
        private var _SafeStr_4979:int;
        private var _SafeStr_4980:int;
        private var _offers:Array;
        private var _SafeStr_4982:_SafeStr_24;
        private var _catalog:HabboCatalog;
        private var _SafeStr_3842:ClubGiftConfirmationDialog;

        public function ClubGiftController(_arg_1:HabboCatalog)
        {
            _catalog = _arg_1;
        }

        public function dispose():void
        {
            _catalog = null;
            if (_SafeStr_3842)
            {
                _SafeStr_3842.dispose();
                _SafeStr_3842 = null;
            };
        }

        public function set widget(_arg_1:ClubGiftWidget):void
        {
            _SafeStr_4981 = _arg_1;
            _catalog.connection.send(new _SafeStr_709());
        }

        public function get daysUntilNextGift():int
        {
            return (_SafeStr_4979);
        }

        public function get giftsAvailable():int
        {
            return (_SafeStr_4980);
        }

        public function setInfo(_arg_1:int, _arg_2:int, _arg_3:Array, _arg_4:_SafeStr_24):void
        {
            _SafeStr_4979 = _arg_1;
            _SafeStr_4980 = _arg_2;
            _offers = _arg_3;
            _SafeStr_4982 = _arg_4;
            if (_SafeStr_4981)
            {
                _SafeStr_4981.update();
            };
        }

        public function selectGift(_arg_1:_SafeStr_3141):void
        {
            closeConfirmation();
            _SafeStr_3842 = new ClubGiftConfirmationDialog(this, _arg_1);
        }

        public function confirmSelection(_arg_1:String):void
        {
            if ((((!(_arg_1)) || (!(_catalog))) || (!(_catalog.connection))))
            {
                return;
            };
            _catalog.connection.send(new _SafeStr_566(_arg_1));
            _SafeStr_4980--;
            _SafeStr_4981.update();
            closeConfirmation();
        }

        public function closeConfirmation():void
        {
            if (_SafeStr_3842)
            {
                _SafeStr_3842.dispose();
                _SafeStr_3842 = null;
            };
        }

        public function getOffers():Array
        {
            return (_offers);
        }

        public function getGiftData():_SafeStr_24
        {
            return (_SafeStr_4982);
        }

        public function get hasClub():Boolean
        {
            if (((!(_catalog)) || (!(_catalog.getPurse()))))
            {
                return (false);
            };
            return (_catalog.getPurse().clubDays > 0);
        }

        public function get windowManager():_SafeStr_1695
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.windowManager);
        }

        public function get localization():_SafeStr_18
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.localization);
        }

        public function get assets():_SafeStr_21
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.assets);
        }

        public function get roomEngine():IRoomEngine
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.roomEngine);
        }

        public function getProductData(_arg_1:String):_SafeStr_3182
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.getProductData(_arg_1));
        }

        public function get purse():_SafeStr_3142
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.getPurse());
        }

        public function get catalog():HabboCatalog
        {
            return (_catalog);
        }


    }
}//package com.sulake.habbo.catalog.club

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3142 = "_-z5" (String#4391, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3842 = "_-413" (String#1546, DoABC#4)
// _SafeStr_4979 = "_-M1d" (String#22306, DoABC#4)
// _SafeStr_4980 = "_-E1z" (String#6816, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_4982 = "_-510" (String#19828, DoABC#4)
// _SafeStr_566 = "_-VF" (String#28993, DoABC#4)
// _SafeStr_709 = "_-Lt" (String#18881, DoABC#4)


