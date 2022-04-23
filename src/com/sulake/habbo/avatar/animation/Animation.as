// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.animation.Animation

package com.sulake.habbo.avatar.animation
{
    import __AS3__.vec.Vector;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.avatar.AvatarStructure;

    public class Animation implements IAnimation 
    {

        private static const _SafeStr_5673:Array = [];

        private var _SafeStr_3820:String;
        private var _description:String;
        private var _SafeStr_5670:Array = [];
        private var _SafeStr_5667:Vector.<ISpriteDataContainer>;
        private var _SafeStr_5671:AvatarDataContainer;
        private var _SafeStr_5672:DirectionDataContainer;
        private var _SafeStr_5668:Array;
        private var _SafeStr_5669:Array;
        private var _overriddenActions:_SafeStr_24;
        private var _overrideFrames:_SafeStr_24;
        private var _SafeStr_5674:Boolean;

        public function Animation(_arg_1:AvatarStructure, _arg_2:XML)
        {
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_3:* = null;
            super();
            _SafeStr_3820 = String(_arg_2.@name);
            if (_arg_2.hasOwnProperty("@desc"))
            {
                _description = String(_arg_2.@desc);
            }
            else
            {
                _description = _SafeStr_3820;
            };
            if (_arg_2.hasOwnProperty("@resetOnToggle"))
            {
                _SafeStr_5674 = Boolean(_arg_2.@resetOnToggle);
            }
            else
            {
                _SafeStr_5674 = false;
            };
            if (_arg_2.hasOwnProperty("sprite"))
            {
                _SafeStr_5667 = new Vector.<ISpriteDataContainer>();
                for each (var _local_6:XML in _arg_2.sprite)
                {
                    _SafeStr_5667.push(new SpriteDataContainer((this as IAnimation), _local_6));
                };
            };
            if (_arg_2.hasOwnProperty("avatar"))
            {
                _SafeStr_5671 = new AvatarDataContainer(_arg_2.avatar[0]);
            };
            if (_arg_2.hasOwnProperty("direction"))
            {
                _SafeStr_5672 = new DirectionDataContainer(_arg_2.direction[0]);
            };
            if (_arg_2.hasOwnProperty("remove"))
            {
                _SafeStr_5668 = [];
                for each (var _local_8:XML in _arg_2.remove)
                {
                    _SafeStr_5668.push(String(_local_8.@id));
                };
            };
            if (_arg_2.hasOwnProperty("add"))
            {
                _SafeStr_5669 = [];
                for each (var _local_9:XML in _arg_2.add)
                {
                    _SafeStr_5669.push(new AddDataContainer(_local_9));
                };
            };
            if (_arg_2.hasOwnProperty("override"))
            {
                _overrideFrames = new _SafeStr_24();
                _overriddenActions = new _SafeStr_24();
                for each (var _local_4:XML in _arg_2.override)
                {
                    _local_5 = _local_4.@name;
                    _local_7 = _local_4.@override;
                    _overriddenActions.add(_local_7, _local_5);
                    _local_3 = [];
                    parseFrames(_local_3, _local_4.frame, _arg_1);
                    _overrideFrames.add(_local_5, _local_3);
                };
            };
            parseFrames(_SafeStr_5670, _arg_2.frame, _arg_1);
        }

        private function parseFrames(_arg_1:Array, _arg_2:XMLList, _arg_3:AvatarStructure):void
        {
            var _local_5:* = null;
            var _local_10:* = null;
            var _local_6:int;
            var _local_4:int;
            var _local_12:* = null;
            var _local_8:* = null;
            for each (var _local_11:XML in _arg_2)
            {
                _local_6 = 1;
                if (_local_11.@repeats > 1)
                {
                    _local_6 = int(_local_11.@repeats);
                };
                _local_4 = 0;
                while (_local_4 < _local_6)
                {
                    _local_5 = [];
                    for each (var _local_9:XML in _local_11.bodypart)
                    {
                        _local_10 = _arg_3.getActionDefinition(String(_local_9.@action));
                        _local_12 = new AnimationLayerData(_local_9, "bodypart", _local_10);
                        _local_5.push(_local_12);
                    };
                    for each (var _local_7:XML in _local_11.fx)
                    {
                        _local_10 = _arg_3.getActionDefinition(String(_local_7.@action));
                        _local_8 = new AnimationLayerData(_local_7, "fx", _local_10);
                        _local_5.push(_local_8);
                        if (_local_10 != null)
                        {
                        };
                    };
                    _arg_1.push(_local_5);
                    _local_4++;
                };
            };
        }

        public function frameCount(_arg_1:String=null):int
        {
            var _local_2:* = null;
            if (!_arg_1)
            {
                return (_SafeStr_5670.length);
            };
            if (_overrideFrames)
            {
                _local_2 = _overrideFrames.getValue(_arg_1);
                if (_local_2)
                {
                    return (_local_2.length);
                };
            };
            return (0);
        }

        public function hasOverriddenActions():Boolean
        {
            if (!_overriddenActions)
            {
                return (false);
            };
            return (_overriddenActions.length > 0);
        }

        public function overriddenActionNames():Array
        {
            if (!_overriddenActions)
            {
                return (null);
            };
            return (_overriddenActions.getKeys());
        }

        public function overridingAction(_arg_1:String):String
        {
            if (!_overriddenActions)
            {
                return (null);
            };
            return (_overriddenActions.getValue(_arg_1));
        }

        private function getFrame(_arg_1:int, _arg_2:String=null):Array
        {
            var _local_3:* = null;
            var _local_4:Array = [];
            if (!_arg_2)
            {
                if (_SafeStr_5670.length > 0)
                {
                    _local_4 = _SafeStr_5670[(_arg_1 % _SafeStr_5670.length)];
                };
            }
            else
            {
                _local_3 = (_overrideFrames.getValue(_arg_2) as Array);
                if (((_local_3) && (_local_3.length > 0)))
                {
                    _local_4 = _local_3[(_arg_1 % _local_3.length)];
                };
            };
            return (_local_4);
        }

        public function getAnimatedBodyPartIds(_arg_1:int, _arg_2:String=null):Array
        {
            var _local_4:Array = [];
            for each (var _local_3:AnimationLayerData in getFrame(_arg_1, _arg_2))
            {
                if (_local_3.type == "bodypart")
                {
                    _local_4.push(_local_3.id);
                }
                else
                {
                    if (_local_3.type == "fx")
                    {
                        if (_SafeStr_5669)
                        {
                            for each (var _local_5:AddDataContainer in _SafeStr_5669)
                            {
                                if (_local_5.id == _local_3.id)
                                {
                                    _local_4.push(_local_5.align);
                                };
                            };
                        };
                    };
                };
            };
            return (_local_4);
        }

        public function getLayerData(_arg_1:int, _arg_2:String, _arg_3:String=null):AnimationLayerData
        {
            for each (var _local_4:AnimationLayerData in getFrame(_arg_1, _arg_3))
            {
                if (_local_4.id == _arg_2)
                {
                    return (_local_4 as AnimationLayerData);
                };
                if (_local_4.type == "fx")
                {
                    for each (var _local_5:AddDataContainer in _SafeStr_5669)
                    {
                        if (((_local_5.align == _arg_2) && (_local_5.id == _local_4.id)))
                        {
                            return (_local_4 as AnimationLayerData);
                        };
                    };
                };
            };
            return (null);
        }

        public function hasAvatarData():Boolean
        {
            return (!(_SafeStr_5671 == null));
        }

        public function hasDirectionData():Boolean
        {
            return (!(_SafeStr_5672 == null));
        }

        public function hasAddData():Boolean
        {
            return (!(_SafeStr_5669 == null));
        }

        public function getAddData(_arg_1:String):AddDataContainer
        {
            if (_SafeStr_5669)
            {
                for each (var _local_2:AddDataContainer in _SafeStr_5669)
                {
                    if (_local_2.id == _arg_1)
                    {
                        return (_local_2);
                    };
                };
            };
            return (null);
        }

        public function get id():String
        {
            return (_SafeStr_3820);
        }

        public function get spriteData():Vector.<ISpriteDataContainer>
        {
            return (_SafeStr_5667);
        }

        public function get avatarData():AvatarDataContainer
        {
            return (_SafeStr_5671);
        }

        public function get directionData():DirectionDataContainer
        {
            return (_SafeStr_5672);
        }

        public function get removeData():Array
        {
            return ((_SafeStr_5668) ? _SafeStr_5668 : _SafeStr_5673);
        }

        public function get addData():Array
        {
            return ((_SafeStr_5669) ? _SafeStr_5669 : _SafeStr_5673);
        }

        public function toString():String
        {
            return (_description);
        }

        public function get resetOnToggle():Boolean
        {
            return (_SafeStr_5674);
        }


    }
}//package com.sulake.habbo.avatar.animation

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_5667 = "_-u3" (String#14615, DoABC#4)
// _SafeStr_5668 = "_-L1A" (String#11806, DoABC#4)
// _SafeStr_5669 = "_-e1W" (String#6173, DoABC#4)
// _SafeStr_5670 = "_-kH" (String#1221, DoABC#4)
// _SafeStr_5671 = "_-Q1d" (String#14214, DoABC#4)
// _SafeStr_5672 = "_-Y7" (String#14339, DoABC#4)
// _SafeStr_5673 = "_-JO" (String#14417, DoABC#4)
// _SafeStr_5674 = "_-gJ" (String#13562, DoABC#4)


