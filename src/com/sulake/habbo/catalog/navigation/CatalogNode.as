// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.navigation.CatalogNode

package com.sulake.habbo.catalog.navigation
{
    import __AS3__.vec.Vector;
    import _-AE._SafeStr_1289;

    public class CatalogNode implements _SafeStr_3170 
    {

        private static const ICON_PREFIX:String = "icon_";

        private var _depth:int = 0;
        private var _localization:String = "";
        private var _SafeStr_4786:int = -1;
        private var _pageName:String = "";
        private var _SafeStr_4983:int = 0;
        private var _children:Vector.<_SafeStr_3170>;
        private var _offerIds:Vector.<int>;
        private var _navigator:_SafeStr_3107;
        private var _parent:_SafeStr_3170;

        public function CatalogNode(_arg_1:_SafeStr_3107, _arg_2:_SafeStr_1289, _arg_3:int, _arg_4:_SafeStr_3170)
        {
            _depth = _arg_3;
            _parent = _arg_4;
            _navigator = _arg_1;
            _localization = _arg_2.localization;
            _SafeStr_4786 = _arg_2.pageId;
            _pageName = _arg_2.pageName;
            _SafeStr_4983 = _arg_2.icon;
            _children = new Vector.<_SafeStr_3170>(0);
            _offerIds = _arg_2.offerIds;
        }

        public function get isOpen():Boolean
        {
            return (false);
        }

        public function get depth():int
        {
            return (_depth);
        }

        public function get isBranch():Boolean
        {
            return (_children.length > 0);
        }

        public function get isLeaf():Boolean
        {
            return (_children.length == 0);
        }

        public function get visible():Boolean
        {
            return (false);
        }

        public function get localization():String
        {
            return (_localization);
        }

        public function get pageId():int
        {
            return (_SafeStr_4786);
        }

        public function get pageName():String
        {
            return (_pageName);
        }

        public function get children():Vector.<_SafeStr_3170>
        {
            return (_children);
        }

        public function get offerIds():Vector.<int>
        {
            return (_offerIds);
        }

        public function get navigator():_SafeStr_3107
        {
            return (_navigator);
        }

        public function get parent():_SafeStr_3170
        {
            return (_parent);
        }

        public function set parent(_arg_1:_SafeStr_3170):void
        {
        }

        public function dispose():void
        {
            for each (var _local_1:_SafeStr_3170 in _children)
            {
                _local_1.dispose();
            };
            _children = null;
            _offerIds = null;
            _navigator = null;
            _parent = null;
            _pageName = "";
            _localization = "";
        }

        public function addChild(_arg_1:_SafeStr_3170):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _children.push(_arg_1);
        }

        public function activate():void
        {
        }

        public function deactivate():void
        {
        }

        public function open():void
        {
        }

        public function close():void
        {
        }

        public function get iconName():String
        {
            if (_SafeStr_4983 < 1)
            {
                return ("");
            };
            return ("icon_" + _SafeStr_4983.toString());
        }

        public function get offsetV():int
        {
            return (0);
        }


    }
}//package com.sulake.habbo.catalog.navigation

// _SafeStr_1289 = "_-H1D" (String#13342, DoABC#4)
// _SafeStr_3107 = "_-Bx" (String#5257, DoABC#4)
// _SafeStr_3170 = "_-51P" (String#969, DoABC#4)
// _SafeStr_4786 = "_-l1k" (String#2541, DoABC#4)
// _SafeStr_4983 = "_-t1S" (String#7966, DoABC#4)


