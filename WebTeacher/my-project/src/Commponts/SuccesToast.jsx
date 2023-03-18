import {useToast} from "@chakra-ui/react";

function Sucessmesg(toast) {
    toast({
        title: 'Account created.',
        position: 'bottom-left',
        description: "We've created your account for you.",
        status: 'success',
        duration: 9000,
        variant:"top-accent",
        isClosable: true,
    })
}
export default Sucessmesg