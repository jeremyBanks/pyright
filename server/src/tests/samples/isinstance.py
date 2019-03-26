class BaseClass:
    def __init__(self) -> None:
        self.property_must_exist: None = None
        self.branch_can_never_run: None = None

class SubClass(BaseClass):
    pass

def self(instance: BaseClass) -> None:
    if isinstance(instance, BaseClass):
        print(instance.property_must_exist)

def sub(instance: BaseClass) -> None:
    if isinstance(instance, SubClass):
        print(instance.property_must_exist)

def super_and_unrelated(instance: BaseClass) -> None:
    if isinstance(instance, (int, object)):
        print(instance.property_must_exist)

def unrelated_and_unrelated(instance: BaseClass) -> None:
    if isinstance(instance, (int, str)):
        print(instance.branch_can_never_run)

def self_and_unrelated(instance: BaseClass) -> None:
    if isinstance(instance, (BaseClass, int)):
        print(instance.property_must_exist)

def sub_and_unrelated(instance: BaseClass) -> None:
    if isinstance(instance, (SubClass, int)):
        print(instance.property_must_exist)
