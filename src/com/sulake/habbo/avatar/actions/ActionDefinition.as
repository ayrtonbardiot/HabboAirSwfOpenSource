// by nota

//com.sulake.habbo.avatar.actions.ActionDefinition

package com.sulake.habbo.avatar.actions
{
    import com.sulake.core.utils._SafeStr_24;
    import flash.utils.Dictionary;

    public class ActionDefinition implements IActionDefinition 
    {

        private var _SafeStr_3820:String;
        private var _SafeStr_3734:String;
        private var _SafeStr_6285:int;
        private var _SafeStr_6286:String;
        private var _assetPartDefinition:String;
        private var _SafeStr_6287:String;
        private var _SafeStr_5952:String;
        private var _isMain:Boolean = false;
        private var _isDefault:Boolean = false;
        private var _isAnimation:Boolean = false;
        private var _SafeStr_6290:Boolean = false;
        private var _SafeStr_6288:Array = [];
        private var _SafeStr_6289:Boolean;
        private var _SafeStr_4237:_SafeStr_24;
        private var _SafeStr_6283:Dictionary = new Dictionary();
        private var _params:Dictionary = new Dictionary();
        private var _SafeStr_6284:String = "";

        public function ActionDefinition(_arg_1:XML)
        {
            var _local_6:* = null;
            var _local_7:* = null;
            var _local_4:* = null;
            super();
            _SafeStr_3820 = String(_arg_1.@id);
            _SafeStr_3734 = String(_arg_1.@state);
            _SafeStr_6285 = parseInt(_arg_1.@precedence);
            _SafeStr_6286 = String(_arg_1.@activepartset);
            _assetPartDefinition = String(_arg_1.@assetpartdefinition);
            _SafeStr_6287 = String(_arg_1.@lay);
            _SafeStr_5952 = String(_arg_1.@geometrytype);
            _isMain = parseInt(_arg_1.@main);
            _isDefault = parseInt(_arg_1.@isdefault);
            _isAnimation = parseInt(_arg_1.@animation);
            _SafeStr_6290 = (_arg_1.@startfromframezero == "true");
            _SafeStr_6289 = (_arg_1.@preventheadturn == "true");
            var _local_3:String = String(_arg_1.@prevents);
            if (_local_3 != "")
            {
                _SafeStr_6288 = _local_3.split(",");
            };
            for each (var _local_2:XML in _arg_1.param)
            {
                _local_6 = String(_local_2.@id);
                _local_7 = String(_local_2.@value);
                if (_local_6 == "default")
                {
                    _SafeStr_6284 = _local_7;
                }
                else
                {
                    _params[_local_6] = _local_7;
                };
            };
            for each (var _local_5:XML in _arg_1.type)
            {
                _local_4 = String(_local_5.@id);
                _SafeStr_6283[_local_4] = new ActionType(_local_5);
            };
        }

        public function setOffsets(_arg_1:String, _arg_2:int, _arg_3:Array):void
        {
            if (_SafeStr_4237 == null)
            {
                _SafeStr_4237 = new _SafeStr_24();
            };
            if (_SafeStr_4237.getValue(_arg_1) == null)
            {
                _SafeStr_4237.add(_arg_1, new _SafeStr_24());
            };
            var _local_4:_SafeStr_24 = _SafeStr_4237.getValue(_arg_1);
            _local_4.add(_arg_2, _arg_3);
        }

        public function getOffsets(_arg_1:String, _arg_2:int):Array
        {
            if (_SafeStr_4237 == null)
            {
                return (null);
            };
            var _local_3:_SafeStr_24 = (_SafeStr_4237.getValue(_arg_1) as _SafeStr_24);
            if (_local_3 == null)
            {
                return (null);
            };
            return (_local_3.getValue(_arg_2) as Array);
        }

        public function getParameterValue(_arg_1:String):String
        {
            if (_arg_1 == "")
            {
                return ("");
            };
            var _local_2:String = _params[_arg_1];
            if (_local_2 == null)
            {
                _local_2 = _SafeStr_6284;
            };
            return (_local_2);
        }

        private function getTypePrevents(_arg_1:String):Array
        {
            if (_arg_1 == "")
            {
                return ([]);
            };
            var _local_2:ActionType = _SafeStr_6283[_arg_1];
            if (_local_2 != null)
            {
                return (_local_2.prevents);
            };
            return ([]);
        }

        public function toString():String
        {
            return ((((((((((((((((((((((("[ActionDefinition]\nid:           " + id) + "\n") + "state:        ") + state) + "\n") + "main:         ") + isMain) + "\n") + "default:      ") + isDefault) + "\n") + "geometry:     ") + state) + "\n") + "precedence:   ") + precedence) + "\n") + "activepartset:") + activePartSet) + "\n") + "activepartdef:") + assetPartDefinition) + "");
        }

        public function get id():String
        {
            return (_SafeStr_3820);
        }

        public function get state():String
        {
            return (_SafeStr_3734);
        }

        public function get precedence():int
        {
            return (_SafeStr_6285);
        }

        public function get activePartSet():String
        {
            return (_SafeStr_6286);
        }

        public function get isMain():Boolean
        {
            return (_isMain);
        }

        public function get isDefault():Boolean
        {
            return (_isDefault);
        }

        public function get assetPartDefinition():String
        {
            return (_assetPartDefinition);
        }

        public function get lay():String
        {
            return (_SafeStr_6287);
        }

        public function get geometryType():String
        {
            return (_SafeStr_5952);
        }

        public function get isAnimation():Boolean
        {
            return (_isAnimation);
        }

        public function getPrevents(_arg_1:String=""):Array
        {
            return (_SafeStr_6288.concat(getTypePrevents(_arg_1)));
        }

        public function getPreventHeadTurn(_arg_1:String=""):Boolean
        {
            if (_arg_1 == "")
            {
                return (_SafeStr_6289);
            };
            var _local_2:ActionType = _SafeStr_6283[_arg_1];
            if (_local_2 != null)
            {
                return (_local_2.preventHeadTurn);
            };
            return (_SafeStr_6289);
        }

        public function isAnimated(_arg_1:String):Boolean
        {
            if (_arg_1 == "")
            {
                return (true);
            };
            var _local_2:ActionType = _SafeStr_6283[_arg_1];
            if (_local_2 != null)
            {
                return (_local_2.isAnimated);
            };
            return (true);
        }

        public function get startFromFrameZero():Boolean
        {
            return (_SafeStr_6290);
        }

        public function get params():Dictionary
        {
            return (_params);
        }


    }
}//package com.sulake.habbo.avatar.actions

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4237 = "_-7h" (String#3677, DoABC#4)
// _SafeStr_5952 = "_-gc" (String#5149, DoABC#4)
// _SafeStr_6283 = "_-q1v" (String#1597, DoABC#4)
// _SafeStr_6284 = "_-P" (String#21821, DoABC#4)
// _SafeStr_6285 = "_-O1L" (String#21301, DoABC#4)
// _SafeStr_6286 = "_-JH" (String#22525, DoABC#4)
// _SafeStr_6287 = "_-r1V" (String#21299, DoABC#4)
// _SafeStr_6288 = "_-z1T" (String#6219, DoABC#4)
// _SafeStr_6289 = "_-32V" (String#8412, DoABC#4)
// _SafeStr_6290 = "_-X1a" (String#15886, DoABC#4)


