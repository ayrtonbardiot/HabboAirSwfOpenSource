﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//deng.fzip.FZip

package deng.fzip
{
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;
    import flash.net.URLStream;
    import flash.utils.ByteArray;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.utils.IDataOutput;
    import flash.utils.IDataInput;
    import flash.utils.*;
    import flash.events.*;

    public class FZip extends EventDispatcher 
    {

        internal static const SIG_CENTRAL_FILE_HEADER:uint = 33639248;
        internal static const SIG_SPANNING_MARKER:uint = 808471376;
        internal static const SIG_LOCAL_FILE_HEADER:uint = 67324752;
        internal static const SIG_DIGITAL_SIGNATURE:uint = 84233040;
        internal static const SIG_END_OF_CENTRAL_DIRECTORY:uint = 101010256;
        internal static const SIG_ZIP64_END_OF_CENTRAL_DIRECTORY:uint = 101075792;
        internal static const SIG_ZIP64_END_OF_CENTRAL_DIRECTORY_LOCATOR:uint = 117853008;
        internal static const SIG_DATA_DESCRIPTOR:uint = 134695760;
        internal static const SIG_ARCHIVE_EXTRA_DATA:uint = 134630224;
        internal static const SIG_SPANNING:uint = 134695760;

        protected var _SafeStr_9192:Array;
        protected var _SafeStr_9193:Dictionary;
        protected var _SafeStr_9194:URLStream;
        protected var _SafeStr_9195:String;
        protected var _SafeStr_9196:Function;
        protected var currentFile:FZipFile;
        protected var _SafeStr_9197:ByteArray;
        protected var _SafeStr_9198:uint;
        protected var _SafeStr_9199:uint;

        public function FZip(_arg_1:String="utf-8")
        {
            _SafeStr_9195 = _arg_1;
            _SafeStr_9196 = parseIdle;
        }

        public function get active():Boolean
        {
            return (!(_SafeStr_9196 === parseIdle));
        }

        public function load(_arg_1:URLRequest):void
        {
            if (((!(_SafeStr_9194)) && (_SafeStr_9196 == parseIdle)))
            {
                _SafeStr_9194 = new URLStream();
                _SafeStr_9194.endian = "littleEndian";
                addEventHandlers();
                _SafeStr_9192 = [];
                _SafeStr_9193 = new Dictionary();
                _SafeStr_9196 = parseSignature;
                _SafeStr_9194.load(_arg_1);
            };
        }

        public function loadBytes(_arg_1:ByteArray):void
        {
            if (((!(_SafeStr_9194)) && (_SafeStr_9196 == parseIdle)))
            {
                _SafeStr_9192 = [];
                _SafeStr_9193 = new Dictionary();
                _arg_1.position = 0;
                _arg_1.endian = "littleEndian";
                _SafeStr_9196 = parseSignature;
                if (parse(_arg_1))
                {
                    _SafeStr_9196 = parseIdle;
                    dispatchEvent(new Event("complete"));
                }
                else
                {
                    dispatchEvent(new FZipErrorEvent("parseError", "EOF"));
                };
            };
        }

        public function close():void
        {
            if (_SafeStr_9194)
            {
                _SafeStr_9196 = parseIdle;
                removeEventHandlers();
                _SafeStr_9194.close();
                _SafeStr_9194 = null;
            };
        }

        public function serialize(_arg_1:IDataOutput, _arg_2:Boolean=false):void
        {
            var _local_7:* = null;
            var _local_8:* = null;
            var _local_4:uint;
            var _local_5:uint;
            var _local_6:int;
            var _local_3:* = null;
            if (((!(_arg_1 == null)) && (_SafeStr_9192.length > 0)))
            {
                _local_7 = _arg_1.endian;
                _local_8 = new ByteArray();
                var _local_9:* = "littleEndian";
                _local_8.endian = _local_9;
                _arg_1.endian = _local_9;
                _local_4 = 0;
                _local_5 = 0;
                _local_6 = 0;
                while (_local_6 < _SafeStr_9192.length)
                {
                    _local_3 = (_SafeStr_9192[_local_6] as FZipFile);
                    if (_local_3 != null)
                    {
                        _local_3.serialize(_local_8, _arg_2, true, _local_4);
                        _local_4 = (_local_4 + _local_3.serialize(_arg_1, _arg_2));
                        _local_5++;
                    };
                    _local_6++;
                };
                if (_local_8.length > 0)
                {
                    _arg_1.writeBytes(_local_8);
                };
                _arg_1.writeUnsignedInt(101010256);
                _arg_1.writeShort(0);
                _arg_1.writeShort(0);
                _arg_1.writeShort(_local_5);
                _arg_1.writeShort(_local_5);
                _arg_1.writeUnsignedInt(_local_8.length);
                _arg_1.writeUnsignedInt(_local_4);
                _arg_1.writeShort(0);
                _arg_1.endian = _local_7;
            };
        }

        public function getFileCount():uint
        {
            return ((_SafeStr_9192) ? _SafeStr_9192.length : 0);
        }

        public function getFileAt(_arg_1:uint):FZipFile
        {
            return ((_SafeStr_9192) ? (_SafeStr_9192[_arg_1] as FZipFile) : null);
        }

        public function getFileByName(_arg_1:String):FZipFile
        {
            return ((_SafeStr_9193[_arg_1]) ? (_SafeStr_9193[_arg_1] as FZipFile) : null);
        }

        public function addFile(_arg_1:String, _arg_2:ByteArray=null, _arg_3:Boolean=true):FZipFile
        {
            return (addFileAt(((_SafeStr_9192) ? _SafeStr_9192.length : 0), _arg_1, _arg_2, _arg_3));
        }

        public function addFileFromString(_arg_1:String, _arg_2:String, _arg_3:String="utf-8", _arg_4:Boolean=true):FZipFile
        {
            return (addFileFromStringAt(((_SafeStr_9192) ? _SafeStr_9192.length : 0), _arg_1, _arg_2, _arg_3, _arg_4));
        }

        public function addFileAt(_arg_1:uint, _arg_2:String, _arg_3:ByteArray=null, _arg_4:Boolean=true):FZipFile
        {
            if (_SafeStr_9192 == null)
            {
                _SafeStr_9192 = [];
            };
            if (_SafeStr_9193 == null)
            {
                _SafeStr_9193 = new Dictionary();
            }
            else
            {
                if (_SafeStr_9193[_arg_2])
                {
                    throw (new Error((("File already exists: " + _arg_2) + ". Please remove first.")));
                };
            };
            var _local_5:FZipFile = new FZipFile();
            _local_5.filename = _arg_2;
            _local_5.setContent(_arg_3, _arg_4);
            if (_arg_1 >= _SafeStr_9192.length)
            {
                _SafeStr_9192.push(_local_5);
            }
            else
            {
                _SafeStr_9192.splice(_arg_1, 0, _local_5);
            };
            _SafeStr_9193[_arg_2] = _local_5;
            return (_local_5);
        }

        public function addFileFromStringAt(_arg_1:uint, _arg_2:String, _arg_3:String, _arg_4:String="utf-8", _arg_5:Boolean=true):FZipFile
        {
            if (_SafeStr_9192 == null)
            {
                _SafeStr_9192 = [];
            };
            if (_SafeStr_9193 == null)
            {
                _SafeStr_9193 = new Dictionary();
            }
            else
            {
                if (_SafeStr_9193[_arg_2])
                {
                    throw (new Error((("File already exists: " + _arg_2) + ". Please remove first.")));
                };
            };
            var _local_6:FZipFile = new FZipFile();
            _local_6.filename = _arg_2;
            _local_6.setContentAsString(_arg_3, _arg_4, _arg_5);
            if (_arg_1 >= _SafeStr_9192.length)
            {
                _SafeStr_9192.push(_local_6);
            }
            else
            {
                _SafeStr_9192.splice(_arg_1, 0, _local_6);
            };
            _SafeStr_9193[_arg_2] = _local_6;
            return (_local_6);
        }

        public function removeFileAt(_arg_1:uint):FZipFile
        {
            var _local_2:* = null;
            if ((((!(_SafeStr_9192 == null)) && (!(_SafeStr_9193 == null))) && (_arg_1 < _SafeStr_9192.length)))
            {
                _local_2 = (_SafeStr_9192[_arg_1] as FZipFile);
                if (_local_2 != null)
                {
                    _SafeStr_9192.splice(_arg_1, 1);
                    delete _SafeStr_9193[_local_2.filename];
                    return (_local_2);
                };
            };
            return (null);
        }

        protected function parse(_arg_1:IDataInput):Boolean
        {
            do 
            {
            } while (_SafeStr_9196(_arg_1));
            return (_SafeStr_9196 === parseIdle);
        }

        protected function parseIdle(_arg_1:IDataInput):Boolean
        {
            return (false);
        }

        protected function parseSignature(_arg_1:IDataInput):Boolean
        {
            var _local_2:uint;
            if (_arg_1.bytesAvailable >= 4)
            {
                _local_2 = _arg_1.readUnsignedInt();
                switch (_local_2)
                {
                    case 67324752:
                        _SafeStr_9196 = parseLocalfile;
                        currentFile = new FZipFile(_SafeStr_9195);
                        break;
                    case 33639248:
                    case 101010256:
                    case 808471376:
                    case 84233040:
                    case 101075792:
                    case 117853008:
                    case 134695760:
                    case 134630224:
                    case 134695760:
                        _SafeStr_9196 = parseIdle;
                        break;
                    default:
                        throw (new Error(("Unknown record signature: 0x" + _local_2.toString(16))));
                };
                return (true);
            };
            return (false);
        }

        protected function parseLocalfile(_arg_1:IDataInput):Boolean
        {
            if (currentFile.parse(_arg_1))
            {
                if (currentFile.hasDataDescriptor)
                {
                    _SafeStr_9196 = findDataDescriptor;
                    _SafeStr_9197 = new ByteArray();
                    _SafeStr_9198 = 0;
                    _SafeStr_9199 = 0;
                    return (true);
                };
                onFileLoaded();
                if (_SafeStr_9196 != parseIdle)
                {
                    _SafeStr_9196 = parseSignature;
                    return (true);
                };
            };
            return (false);
        }

        protected function findDataDescriptor(_arg_1:IDataInput):Boolean
        {
            var _local_2:uint;
            while (_arg_1.bytesAvailable > 0)
            {
                _local_2 = _arg_1.readUnsignedByte();
                _SafeStr_9198 = ((_SafeStr_9198 >>> 8) | (_local_2 << 24));
                if (_SafeStr_9198 == 134695760)
                {
                    _SafeStr_9197.length = (_SafeStr_9197.length - 3);
                    _SafeStr_9196 = validateDataDescriptor;
                    return (true);
                };
                _SafeStr_9197.writeByte(_local_2);
            };
            return (false);
        }

        protected function validateDataDescriptor(_arg_1:IDataInput):Boolean
        {
            var _local_4:uint;
            var _local_2:uint;
            var _local_3:uint;
            if (_arg_1.bytesAvailable >= 12)
            {
                _local_4 = _arg_1.readUnsignedInt();
                _local_2 = _arg_1.readUnsignedInt();
                _local_3 = _arg_1.readUnsignedInt();
                if (_SafeStr_9197.length == _local_2)
                {
                    _SafeStr_9197.position = 0;
                    currentFile._crc32 = _local_4;
                    currentFile._sizeCompressed = _local_2;
                    currentFile._sizeUncompressed = _local_3;
                    currentFile.parseContent(_SafeStr_9197);
                    onFileLoaded();
                    _SafeStr_9196 = parseSignature;
                }
                else
                {
                    _SafeStr_9197.writeUnsignedInt(_local_4);
                    _SafeStr_9197.writeUnsignedInt(_local_2);
                    _SafeStr_9197.writeUnsignedInt(_local_3);
                    _SafeStr_9196 = findDataDescriptor;
                };
                return (true);
            };
            return (false);
        }

        protected function onFileLoaded():void
        {
            _SafeStr_9192.push(currentFile);
            if (currentFile.filename)
            {
                _SafeStr_9193[currentFile.filename] = currentFile;
            };
            dispatchEvent(new FZipEvent("fileLoaded", currentFile));
            currentFile = null;
        }

        protected function progressHandler(_arg_1:Event):void
        {
            var _local_2:* = null;
            dispatchEvent(_arg_1.clone());
            try
            {
                if (parse(_SafeStr_9194))
                {
                    close();
                    dispatchEvent(new Event("complete"));
                };
            }
            catch(e:Error)
            {
                close();
                if (hasEventListener("parseError"))
                {
                    dispatchEvent(new FZipErrorEvent("parseError", e.message));
                }
                else
                {
                    _local_2 = "";
                    if (_SafeStr_9194 != null)
                    {
                        _local_2 = _SafeStr_9194.toString();
                    };
                    (trace(("[FZip] Zip error: " + e.message)));
                };
            };
        }

        protected function defaultHandler(_arg_1:Event):void
        {
            dispatchEvent(_arg_1.clone());
        }

        protected function defaultErrorHandler(_arg_1:Event):void
        {
            close();
            dispatchEvent(_arg_1.clone());
        }

        protected function addEventHandlers():void
        {
            _SafeStr_9194.addEventListener("complete", defaultHandler);
            _SafeStr_9194.addEventListener("open", defaultHandler);
            _SafeStr_9194.addEventListener("httpStatus", defaultHandler);
            _SafeStr_9194.addEventListener("ioError", defaultErrorHandler);
            _SafeStr_9194.addEventListener("securityError", defaultErrorHandler);
            _SafeStr_9194.addEventListener("progress", progressHandler);
        }

        protected function removeEventHandlers():void
        {
            _SafeStr_9194.removeEventListener("complete", defaultHandler);
            _SafeStr_9194.removeEventListener("open", defaultHandler);
            _SafeStr_9194.removeEventListener("httpStatus", defaultHandler);
            _SafeStr_9194.removeEventListener("ioError", defaultErrorHandler);
            _SafeStr_9194.removeEventListener("securityError", defaultErrorHandler);
            _SafeStr_9194.removeEventListener("progress", progressHandler);
        }


    }
}//package deng.fzip

// _SafeStr_9192 = "_-T17" (String#8473, DoABC#3)
// _SafeStr_9193 = "_-uw" (String#10369, DoABC#3)
// _SafeStr_9194 = "_-L1P" (String#7944, DoABC#3)
// _SafeStr_9195 = "_-N1L" (String#8060, DoABC#3)
// _SafeStr_9196 = "_-hS" (String#9497, DoABC#3)
// _SafeStr_9197 = "_-TV" (String#8521, DoABC#3)
// _SafeStr_9198 = "_-f19" (String#9325, DoABC#3)
// _SafeStr_9199 = "_-iF" (String#9554, DoABC#3)


