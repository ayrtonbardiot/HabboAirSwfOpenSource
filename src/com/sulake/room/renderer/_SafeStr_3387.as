// by nota

//com.sulake.room.renderer._SafeStr_3387

package com.sulake.room.renderer
{
    import flash.display.Sprite;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.RoomGeometry;
    import com.sulake.room.utils.RoomShakingEffect;
    import com.sulake.room.utils.RoomRotatingEffect;
    import flash.geom.Rectangle;

    [SecureSWF(rename="true")]
    public class _SafeStr_3387 extends _SafeStr_3381 
    {

        private var _tools:Sprite;
        private var _SafeStr_6507:Boolean = false;
        private var _rotation:Number = 0;
        private var _rotationOrigin:Vector3d = null;
        private var _rotationRodLength:Number = 0;
        private var _SafeStr_6508:Array = [];
        private var _SafeStr_6509:Array = [];
        private var _SafeStr_6505:Vector3d;
        private var _SafeStr_6506:Vector3d;
        private var _SafeStr_4002:int = 0;

        public function _SafeStr_3387(_arg_1:_SafeStr_3203, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        override public function dispose():void
        {
            super.dispose();
            _tools = null;
            _SafeStr_6508 = [];
            _SafeStr_6509 = [];
        }

        override public function initialize(_arg_1:int, _arg_2:int):void
        {
            super.initialize(_arg_1, _arg_2);
        }

        override public function render(_arg_1:int, _arg_2:Boolean=false):void
        {
            doMagic();
            super.render(_arg_1, _arg_2);
        }

        override public function handleMouseEvent(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):Boolean
        {
            var _local_8:Boolean = super.handleMouseEvent(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7);
            if (_arg_3 == "click")
            {
                checkButtonHits((_arg_1 + screenOffsetX), (_arg_2 + screenOffsetY));
            };
            return (_local_8);
        }

        private function getGeometry():RoomGeometry
        {
            return (geometry as RoomGeometry);
        }

        private function doMagic():void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_1:* = null;
            if (_rotation != 0)
            {
                _local_2 = _SafeStr_6505;
                getGeometry().direction = new Vector3d((_local_2.x + _rotation), _local_2.y, _local_2.z);
                _local_2 = getGeometry().direction;
                getGeometry().setDepthVector(new Vector3d(_local_2.x, _local_2.y, 5));
                _local_3 = new Vector3d();
                _local_3.assign(_rotationOrigin);
                _local_3.x = (_local_3.x + ((_rotationRodLength * Math.cos((((_local_2.x + 180) / 180) * 3.14159265358979))) * Math.cos(((_local_2.y / 180) * 3.14159265358979))));
                _local_3.y = (_local_3.y + ((_rotationRodLength * Math.sin((((_local_2.x + 180) / 180) * 3.14159265358979))) * Math.cos(((_local_2.y / 180) * 3.14159265358979))));
                _local_3.z = (_local_3.z + (_rotationRodLength * Math.sin(((_local_2.y / 180) * 3.14159265358979))));
                getGeometry().location = _local_3;
                _SafeStr_6506 = new Vector3d();
                _SafeStr_6506.assign(_local_3);
                _SafeStr_6505 = new Vector3d();
                _SafeStr_6505.assign(getGeometry().direction);
            };
            if (((RoomShakingEffect.isVisualizationOn()) && (!(_SafeStr_6507))))
            {
                changeShaking();
            }
            else
            {
                if (((!(RoomShakingEffect.isVisualizationOn())) && (_SafeStr_6507)))
                {
                    changeShaking();
                };
            };
            if (RoomRotatingEffect.isVisualizationOn())
            {
                changeRotation();
            };
            if (_SafeStr_6507)
            {
                _SafeStr_4002++;
                _local_4 = _SafeStr_6505;
                _local_1 = Vector3d.sum(_local_4, new Vector3d((Math.sin((((_SafeStr_4002 * 5) / 180) * 3.14159265358979)) * 2), (Math.sin(((_SafeStr_4002 / 180) * 3.14159265358979)) * 5), (Math.sin((((_SafeStr_4002 * 10) / 180) * 3.14159265358979)) * 2)));
                getGeometry().direction = _local_1;
            }
            else
            {
                _SafeStr_4002 = 0;
                getGeometry().direction = _SafeStr_6505;
            };
        }

        private function createTestingTools():void
        {
            var _local_4:* = null;
            var _local_1:* = null;
            var _local_3:int;
            var _local_2:int;
            if (((_tools == null) && (displayObject is Sprite)))
            {
                _tools = new Sprite();
                (displayObject as Sprite).addChild(_tools);
                _local_4 = [0xFFFF00, 0xFF0000, 0xFF00, 0xAAAAAA, 0xAAAAAA, 0xAAAAAA, 0xAAAAAA];
                _local_1 = null;
                _local_1 = new Rectangle(58, 8, 16, 16);
                _SafeStr_6508.push(_local_1);
                _local_1 = new Rectangle(58, 28, 16, 16);
                _SafeStr_6508.push(_local_1);
                _local_1 = new Rectangle(58, 48, 16, 16);
                _SafeStr_6508.push(_local_1);
                _local_1 = new Rectangle(82, 28, 16, 16);
                _SafeStr_6508.push(_local_1);
                _local_1 = new Rectangle(122, 28, 16, 16);
                _SafeStr_6508.push(_local_1);
                _local_1 = new Rectangle(102, 8, 16, 16);
                _SafeStr_6508.push(_local_1);
                _local_1 = new Rectangle(102, 48, 16, 16);
                _SafeStr_6508.push(_local_1);
                _local_3 = 0;
                while (_local_3 < _SafeStr_6508.length)
                {
                    _local_1 = (_SafeStr_6508[_local_3] as Rectangle);
                    _local_2 = 0;
                    _tools.graphics.beginFill(_local_2);
                    _tools.graphics.drawRect((_local_1.x - 1), (_local_1.y - 1), (_local_1.width + 2), (_local_1.height + 2));
                    _tools.graphics.endFill();
                    _local_2 = _local_4[_local_3];
                    _tools.graphics.beginFill(_local_2);
                    _tools.graphics.drawRect(_local_1.x, _local_1.y, _local_1.width, _local_1.height);
                    _tools.graphics.endFill();
                    _local_3++;
                };
                _SafeStr_6509.push(changeScale);
                _SafeStr_6509.push(changeShaking);
                _SafeStr_6509.push(changeRotation);
                _SafeStr_6509.push(moveLeft);
                _SafeStr_6509.push(moveRight);
                _SafeStr_6509.push(moveUp);
                _SafeStr_6509.push(moveDown);
            };
        }

        private function checkButtonHits(_arg_1:int, _arg_2:int):void
        {
            var _local_4:int;
            var _local_3:* = null;
            _local_4 = 0;
            while (_local_4 < _SafeStr_6508.length)
            {
                _local_3 = (_SafeStr_6508[_local_4] as Rectangle);
                if (((((_arg_1 >= _local_3.x) && (_arg_1 <= (_local_3.x + _local_3.width))) && (_arg_2 >= _local_3.y)) && (_arg_2 <= (_local_3.y + _local_3.height))))
                {
                    if (_SafeStr_6509.length > _local_4)
                    {
                        (_SafeStr_6509[_local_4]());
                    };
                };
                _local_4++;
            };
        }

        private function changeScale():void
        {
            if (getGeometry().scale < 64)
            {
                getGeometry().scale = 64;
            }
            else
            {
                getGeometry().scale = 32;
            };
        }

        private function changeShaking():void
        {
            var _local_1:* = null;
            _SafeStr_6507 = (!(_SafeStr_6507));
            if (_SafeStr_6507)
            {
                _local_1 = getGeometry().direction;
                _SafeStr_6505 = new Vector3d(_local_1.x, _local_1.y, _local_1.z);
            };
        }

        private function changeRotation():void
        {
            var _local_3:* = null;
            var _local_1:* = null;
            var _local_2:* = null;
            if (_SafeStr_6507)
            {
                return;
            };
            if (_rotation == 0)
            {
                if (getGeometry() != null)
                {
                    _local_3 = getGeometry().location;
                    _local_1 = getGeometry().directionAxis;
                    _SafeStr_6506 = new Vector3d();
                    _SafeStr_6506.assign(_local_3);
                    _SafeStr_6505 = new Vector3d();
                    _SafeStr_6505.assign(getGeometry().direction);
                    _local_2 = RoomGeometry.getIntersectionVector(_local_3, _local_1, new Vector3d(0, 0, 0), new Vector3d(0, 0, 1));
                    if (_local_2 != null)
                    {
                        _rotationOrigin = new Vector3d(_local_2.x, _local_2.y, _local_2.z);
                        _rotationRodLength = Vector3d.dif(_local_2, _local_3).length;
                        _rotation = 1;
                    };
                };
            }
            else
            {
                _rotation = 0;
                if (getGeometry() != null)
                {
                    getGeometry().location = _SafeStr_6506;
                    getGeometry().direction = _SafeStr_6505;
                    getGeometry().setDepthVector(new Vector3d(_SafeStr_6505.x, _SafeStr_6505.y, 5));
                };
            };
        }

        private function moveLeft():void
        {
            var _local_1:Number;
            if (_rotation != 0)
            {
                if (_rotation == 1)
                {
                    _rotation = -1;
                }
                else
                {
                    _rotation = (_rotation - 1);
                };
                return;
            };
            if (getGeometry() != null)
            {
                _local_1 = (((getGeometry().direction.x - 90) / 180) * 3.14159265358979);
                getGeometry().location = Vector3d.sum(getGeometry().location, new Vector3d((Math.cos(_local_1) * Math.sqrt(2)), (Math.sin(_local_1) * Math.sqrt(2))));
            };
        }

        private function moveRight():void
        {
            var _local_1:Number;
            if (_rotation != 0)
            {
                if (_rotation == -1)
                {
                    _rotation = 1;
                }
                else
                {
                    _rotation = (_rotation + 1);
                };
                return;
            };
            if (getGeometry() != null)
            {
                _local_1 = (((getGeometry().direction.x + 90) / 180) * 3.14159265358979);
                getGeometry().location = Vector3d.sum(getGeometry().location, new Vector3d((Math.cos(_local_1) * Math.sqrt(2)), (Math.sin(_local_1) * Math.sqrt(2))));
            };
        }

        private function moveUp():void
        {
            var _local_1:Number;
            if (_rotation != 0)
            {
                return;
            };
            if (getGeometry() != null)
            {
                _local_1 = ((getGeometry().direction.x / 180) * 3.14159265358979);
                getGeometry().location = Vector3d.sum(getGeometry().location, new Vector3d((Math.cos(_local_1) * Math.sqrt(2)), (Math.sin(_local_1) * Math.sqrt(2))));
            };
        }

        private function moveDown():void
        {
            var _local_1:Number;
            if (_rotation != 0)
            {
                return;
            };
            if (getGeometry() != null)
            {
                _local_1 = (((geometry.direction.x + 180) / 180) * 3.14159265358979);
                getGeometry().location = Vector3d.sum(getGeometry().location, new Vector3d((Math.cos(_local_1) * Math.sqrt(2)), (Math.sin(_local_1) * Math.sqrt(2))));
            };
        }


    }
}//package com.sulake.room.renderer

// _SafeStr_3203 = "_-5c" (String#8823, DoABC#4)
// _SafeStr_3381 = "_-m1y" (String#5604, DoABC#4)
// _SafeStr_3387 = "_-W1H" (String#14185, DoABC#4)
// _SafeStr_4002 = "_-iP" (String#1397, DoABC#4)
// _SafeStr_6505 = "_-lG" (String#5102, DoABC#4)
// _SafeStr_6506 = "_-91f" (String#8906, DoABC#4)
// _SafeStr_6507 = "_-B2" (String#8296, DoABC#4)
// _SafeStr_6508 = "_-L1m" (String#4660, DoABC#4)
// _SafeStr_6509 = "_-f9" (String#5522, DoABC#4)


