# Comparing Enums
```swift
enum Size {
	case small, medium, large
}

print(Size.small < Size.medium)
print(Size.small < Size.large)
```
You would think that the following would both print true, but actually Swift would complain.
In order to have comparison for enums, you must add the **Comparable** option to your enum:
```swift
enum Size: Comparable {
	case small, medium, large
}

print(Size.small < Size.medium)
print(Size.small < Size.large)
```

# Switch Statements
>How are enums in Swift different from other languages?
>1. You must have a case for all possible scenarios (i.e. all cases of an enum)
>2. The Switch statement stops running once you meet your case that is True. It does not check further cases

